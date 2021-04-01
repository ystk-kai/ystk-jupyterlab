FROM jupyter/base-notebook:latest

# Java
RUN conda install --quiet --yes -c conda-forge 'scijava-jupyter-kernel'

# Kotlin
RUN conda install --quiet --yes -c jetbrains 'kotlin-jupyter-kernel'

# C++
RUN conda install xeus-cling --quiet --yes -c conda-forge

RUN conda clean --all

# Rebuild for Extensions
RUN jupyter lab build

ENV JUPYTER_ENABLE_LAB yes
