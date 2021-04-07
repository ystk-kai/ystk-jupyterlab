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
COPY languages/golang.sh languages/golang.sh
RUN bash languages/golang.sh

# Gradle
ENV GRADLE_VERSION 6.8.3
ENV PATH /opt/gradle/gradle-$GRADLE_VERSION/bin:$PATH
COPY languages/gradle.sh languages/gradle.sh
RUN bash languages/gradle.sh

RUN apt-get clean

ENV JUPYTER_ENABLE_LAB yes
