FROM debian:12

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget bzip2 && \
    apt-get clean

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
RUN conda install --yes python=3.11 jupyter pandas seaborn && \
    conda clean --all -f -y

# Set working directory
WORKDIR /workspace

# Define a volume for notebooks
VOLUME ["/workspace/notebooks"]

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook, set notebook dir to the volume
CMD ["jupyter", "notebook", "--notebook-dir=/workspace/notebooks", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]