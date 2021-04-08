FROM golang:buster as golang

FROM jupyter/scipy-notebook:latest

# C++
RUN conda install --quiet --yes -c conda-forge --override-channels xeus-cling

# Java
RUN conda install --quiet --yes -c conda-forge --override-channels scijava-jupyter-kernel

# Kotlin
RUN conda install --quiet --yes -c jetbrains --override-channels kotlin-jupyter-kernel

RUN conda clean --all

USER root

RUN apt-get update
RUN apt-get install -y curl jq

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

RUN apt-get clean

ENV JUPYTER_ENABLE_LAB yes
