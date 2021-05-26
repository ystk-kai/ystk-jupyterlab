#!/usr/bin/env bash

set -eo pipefail

# TODO: We currently do not support installations in Docker containers or on remote servers
# https://help.kite.com/article/106-linux-install-issues

# curl -Lo kite-installer.sh https://linux.kite.com/dls/linux/current
# bash ./kite-installer.sh --install
# rm -rf ./kite-installer.sh

# pip install "jupyterlab-kite>=2.0.2"

pip install lckr-jupyterlab-variableinspector

jupyter labextension install @jupyterlab/toc
