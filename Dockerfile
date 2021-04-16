FROM golang:buster as golang

FROM jupyter/scipy-notebook:latest

# C++
RUN conda install --quiet --yes -c conda-forge --override-channels xeus-cling && conda clean --all

# Java
RUN conda install --quiet --yes -c conda-forge --override-channels scijava-jupyter-kernel && conda clean --all

# Kotlin
RUN conda install --quiet --yes -c jetbrains --override-channels kotlin-jupyter-kernel && conda clean --all

USER root

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates gnupg lsb-release curl jq && \
    apt-get clean

# Go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
COPY --from=golang /usr/local/go/ /usr/local/go/
COPY docker/golang.sh docker/golang.sh
RUN bash docker/golang.sh

# Gradle
ENV GRADLE_VERSION 6.8.3
ENV PATH /opt/gradle/gradle/bin:$PATH
COPY docker/gradle.sh docker/gradle.sh
RUN bash docker/gradle.sh

# GitHub CLI
ENV GITHUB_CLI_VERSION 1.8.1
ENV PATH /usr/local/gh/bin:$PATH
COPY docker/github-cli.sh docker/github-cli.sh
RUN bash docker/github-cli.sh

# Docker
COPY docker/docker.sh docker/docker.sh
RUN bash docker/docker.sh

# Lua
RUN pip install --no-cache-dir ilua

ENV JUPYTER_ENABLE_LAB yes
