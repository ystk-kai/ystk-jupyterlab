#!/usr/bin/env sh

set -eo pipefail

source modules/docker.sh

container_tag=${1:-latest}
container_image=${2:-ystkkai/ystk-jupyterlab}

docker_pull $container_image:$container_tag ystk-jupyterlab:$container_tag
