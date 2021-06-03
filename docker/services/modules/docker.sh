#!/usr/bin/env bash

set -eo pipefail

function docker_push() {
    local project container_tag
    project=$1
    container_tag=$2

    image_name=ystk-jupyterlab

    echo "Local container image: $image_name:latest"
    echo "Remote container image: $project/$image_name:$container_tag"

    docker tag $image_name:latest $project/$image_name:$container_tag
    docker push $project/$image_name:$container_tag
}

function docker_pull() {
    local container_image_local container_image_remote

    echo "Local container image: ${container_image_local}"
    echo "Remote container image: ${container_image_remote}"

    docker pull $container_image_remote
    docker tag $container_image_remote $container_image_local
}
