FROM jupyter/base-notebook:latest

# Java
RUN conda install --quiet --yes -c conda-forge --override-channels scijava-jupyter-kernel

# Kotlin
RUN conda install --quiet --yes -c jetbrains --override-channels kotlin-jupyter-kernel

# C++
RUN conda install --quiet --yes -c conda-forge --override-channels xeus-cling

RUN conda clean --all

ENV JUPYTER_ENABLE_LAB yes
