#!/usr/bin/env sh

set -eo pipefail

container_tag=${1:-latest}
container_image=${2:-ystkkai/ystk-jupyterlab}

echo "Local container image: ystk-jupyterlab:$container_tag"
echo "Remote container image: $container_image:$container_tag"

docker pull $container_image:$container_tag
docker tag $container_image:$container_tag ystk-jupyterlab:$container_tag
