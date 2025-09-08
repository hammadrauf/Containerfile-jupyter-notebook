FROM debian:13-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget bzip2 && \
    apt-get install -y octave && \
    apt-get clean

# Set OCTAVE_EXECUTABLE environment variable
ENV OCTAVE_EXECUTABLE=/usr/bin/octave
ENV JUPYTER_TOKEN=

# Install Miniconda
ENV CONDA_DIR=/opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh
ENV PATH=$CONDA_DIR/bin:$PATH

# Accept Anaconda Terms of Service for required channels
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# Create a conda environment and install packages
RUN conda install --yes python=3.11 jupyter pandas seaborn nbconvert texlive-core pandoc
# Install octave-kernel and texinfo from conda-forge
RUN conda config --add channels conda-forge && \
    conda tos accept && \
    conda install --yes octave_kernel texinfo && \
    conda clean --all -f -y

# Configure Jupyter:
#   octave-kernel: set plot backend to 'qt'
#   nbconvert: set export format to 'latex' and use 'basic' template
#   nbconvert latex template: create a basic template that extends the base template
RUN mkdir -p /root/.jupyter/nbconvert/templates/latex && \
    echo "c.OctaveKernel.plot_settings = dict(backend='qt')" > /root/.jupyter/octave_kernel_config.py && \
    echo "c.NbConvertApp.export_format = 'latex'" > /root/.jupyter/jupyter_nbconvert_config.py && \
    echo "c.NbConvertApp.template_file = 'basic'" >> /root/.jupyter/jupyter_nbconvert_config.py
    # echo "{% extends 'base.html' %}" > /root/.jupyter/nbconvert/templates/latex/base.tplx && \
    # echo "{% block body %}" >> /root/.jupyter/nbconvert/templates/latex/base.tplx

# Optionally, set OCTAVE_KERNEL_JSON if you want to specify a custom kernel spec path
#ENV OCTAVE_KERNEL_JSON=/root/.local/share/jupyter/kernels/octave/kernel.json

# Set working directory
WORKDIR /workspace

# Define a volume for notebooks
VOLUME ["/workspace/notebooks"]

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook, set notebook dir to the volume
#CMD ["jupyter", "notebook", "--notebook-dir=/workspace/notebooks", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
CMD ["sh", "-c", "jupyter notebook --notebook-dir=/workspace/notebooks --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token='${JUPYTER_TOKEN}'"]