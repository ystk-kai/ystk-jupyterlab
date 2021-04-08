#!/usr/bin/env bash

set -eo pipefail

branch=$([[ $GITHUB_REF =~ ^refs/heads/(.*)$ ]] && echo ${BASH_REMATCH[1]})
[[ -z "$branch" ]] && exit 1

container_tag="$branch"

if [[ "$branch" == "master" ]]; then
    container_tag=latest
fi

image_name=ystk-jupyterlab
registry=docker.pkg.github.com/ystk-kai/ystk-jupyterlab

docker login docker.pkg.github.com -u ystk-kai --password-stdin <<< "$GITHUB_TOKEN"

docker tag $image_name:latest $registry/$image_name:$container_tag
docker push $registry/$image_name:$container_tag
