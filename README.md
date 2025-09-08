# Containerfile-jupyter-notebook

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
    docker run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks docker.io/hammadrauf/jupyter-notebook
    ```

- With Podman:
    ```
    podman run -p 8888:8888 -v <local-notebooks-dir>:/workspace/notebooks quay.io/hammadrauf/jupyter-notebook
    ```
- Then open http://localhost:8888 in your browser. No token is required to access the Jupyter Notebook.

## How to Use it with Copilot
- Video Link 1 [https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks](https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks)
- Video Link 2 [https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks](https://learn.microsoft.com/en-us/shows/github-copilot-series/using-copilot-with-jupyter-notebooks)
- To Do:

