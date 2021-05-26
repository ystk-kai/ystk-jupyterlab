FROM golang:buster as golang

FROM jupyter/datascience-notebook:latest

# Support packages
COPY ./support-package.sh docker/support-package.sh
USER root
RUN bash docker/support-package.sh
USER jovyan

# Python
COPY ./python.sh docker/python.sh
RUN bash docker/python.sh

# C++
RUN conda install --quiet --yes -c conda-forge --override-channels xeus-cling && conda clean --all

# Java
RUN conda install --quiet --yes -c conda-forge --override-channels scijava-jupyter-kernel && conda clean --all

# Kotlin
RUN conda install --quiet --yes -c jetbrains --override-channels kotlin-jupyter-kernel && conda clean --all

# Lua
RUN pip install --no-cache-dir ilua

# JavaScript(Node.js) and TypeScript
RUN npm install -g tslab && npm cache clean --force
RUN tslab install

# Rust
ENV PATH $HOME/.cargo/bin:$PATH
COPY ./rust.sh docker/rust.sh
USER root
RUN apt-get update && apt-get install --no-install-recommends -y cmake build-essential && apt-get clean
USER jovyan
RUN bash docker/rust.sh

# Go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
COPY --from=golang /usr/local/go/ /usr/local/go/
COPY ./golang.sh docker/golang.sh
USER root
RUN apt-get update && apt-get install --no-install-recommends -y apt-transport-https ca-certificates gnupg lsb-release && apt-get clean
RUN mkdir -p $GOPATH /usr/local/share/jupyter && chown jovyan $GOPATH /usr/local/share/jupyter
USER jovyan
RUN bash docker/golang.sh

# .NET
ENV DOTNET_ROOT /usr/share/dotnet
ENV PATH /usr/share/dotnet:/jovyan/.dotnet/tools:$PATH
COPY ./dotnet.sh docker/dotnet.sh
USER root
RUN mkdir -p /usr/share/dotnet /usr/bin/dotnet /jovyan/.dotnet/tools && chown jovyan /usr/share/dotnet /usr/bin/dotnet /jovyan/.dotnet/tools
USER jovyan
RUN bash docker/dotnet.sh

# Gradle
# https://github.com/gradle/gradle/releases
ENV GRADLE_VERSION 7.0.2
ENV PATH /opt/gradle/gradle/bin:$PATH
COPY ./gradle.sh docker/gradle.sh
USER root
RUN mkdir -p /opt/gradle && chown jovyan /opt/gradle
USER jovyan
RUN bash docker/gradle.sh

# GitHub CLI
# https://github.com/cli/cli/releases/
ENV GITHUB_CLI_VERSION 1.9.2
ENV PATH /usr/local/gh/bin:$PATH
COPY ./github-cli.sh docker/github-cli.sh
USER root
RUN mkdir -p /usr/local/gh && chown jovyan /usr/local/gh
USER jovyan
RUN bash docker/github-cli.sh

# Docker
COPY ./docker.sh docker/docker.sh
USER root
RUN bash docker/docker.sh
USER jovyan

# JupyterLab Extensions
COPY ./lab-extension.sh docker/lab-extension.sh
RUN bash docker/lab-extension.sh

ENV JUPYTER_ENABLE_LAB yes
