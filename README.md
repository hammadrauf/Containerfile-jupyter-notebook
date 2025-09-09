# Containerfile-jupyter-notebook
A Container image with Jupyter-Notebook. It is specially customized for Python, Pandas, Seaborn, GNU-Octave, Latex and PDF. It uses mini-conda for managing Python libraries.
  
Use it in a local Host-OS Volume for Notebooks. It can be used from VSCode with following:Extensions:
- Github Copilot (From Github)
- Github Copilot Chat (From Github)
- Container Tools (From Microsoft)
- Jupyter (From Microsoft)

## On Quay.io
- [https://quay.io/repository/hammadrauf/jupyter-notebook](https://quay.io/repository/hammadrauf/jupyter-notebook)
```
podman pull quay.io/hammadrauf/jupyter-notebook
```

## On Dockerhub
- [https://hub.docker.com/r/hammadrauf/jupyter-notebook](https://hub.docker.com/r/hammadrauf/jupyter-notebook)
```
docker pull docker.io/hammadrauf/jupyter-notebook
```


## How to Use

You can run the container and mount a local directory for your notebooks using the following command (replace <local-notebooks-dir> with the path on your machine where you want to store notebooks):

- With Docker:
    ```
    docker run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks docker.io/hammadrauf/jupyter-notebook
    ```

- With Podman:
    ```
    podman run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks quay.io/hammadrauf/jupyter-notebook
    ```

Then open [http://localhost:8888](http://localhost:8888) in your browser, or start a *.ipynb jupyter notebook in VSCode.
  
By default, no token is required to access the Jupyter Notebook.

### Optional: Set a Jupyter Token

To require a token for access, set the `JUPYTER_TOKEN` environment variable:

- With Docker:
    ```
    docker run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks -e JUPYTER_TOKEN=yourtoken docker.io/hammadrauf/jupyter-notebook
    ```

- With Podman:
    ```
    podman run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks -e JUPYTER_TOKEN=yourtoken quay.io/hammadrauf/jupyter-notebook
    ```

Then open [http://localhost:8888](http://localhost:8888) in your browser and enter the token if prompted. Or start a *.ipynb jupyter notebook in VSCode.

## How to Use it with Copilot
Although this video uses a different container (and VSCode extensions) for Jupyter, but the concepts, and usage idea is similar.
- Video Link [https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks](https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks)

