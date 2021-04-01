FROM jupyter/base-notebook:latest

COPY jupyter/jupyter_notebook_config.py /home/jovyan/.jupyter/

# Java
RUN conda install --quiet --yes -c conda-forge 'scijava-jupyter-kernel'

# Kotlin
RUN conda install --quiet --yes -c jetbrains 'kotlin-jupyter-kernel'

# C++
RUN conda install xeus-cling  --quiet --yes -c conda-forge

RUN conda clean --all

ENV JUPYTER_ENABLE_LAB yes
