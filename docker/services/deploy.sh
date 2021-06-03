#!/usr/bin/env bash

set -eo pipefail

source modules/docker.sh

branch=$([[ $GITHUB_REF =~ ^refs/heads/(.*)$ ]] && echo ${BASH_REMATCH[1]})
[[ -z "$branch" ]] && exit 1

container_tag="$branch"

if [[ "$branch" == "master" ]]; then
    container_tag=latest
fi

# Docker Hub
docker login --username "$DOCKERHUB_USER" --password-stdin <<< "$DOCKERHUB_TOKEN"
docker_push \
    ystkkai \
    "$container_tag"

# GitHub Package
docker login docker.pkg.github.com --username "$GITHUB_USER" --password-stdin <<< "$GITHUB_TOKEN"
docker_push \
    docker.pkg.github.com/ystk-kai/ystk-jupyterlab \
    "$container_tag"
