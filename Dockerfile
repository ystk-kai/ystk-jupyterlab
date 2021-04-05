FROM golang:buster as golang

FROM jupyter/scipy-notebook:latest

# Go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
COPY --from=golang /usr/local/go/ /usr/local/go/
COPY languages/golang.sh languages/golang.sh
USER root
RUN bash languages/golang.sh
USER jovyan

# C++
RUN conda install --quiet --yes -c conda-forge --override-channels xeus-cling

# Java
RUN conda install --quiet --yes -c conda-forge --override-channels scijava-jupyter-kernel

# Kotlin
RUN conda install --quiet --yes -c jetbrains --override-channels kotlin-jupyter-kernel

RUN conda clean --all

ENV JUPYTER_ENABLE_LAB yes
