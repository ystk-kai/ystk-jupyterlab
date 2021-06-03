#!/usr/bin/env bash

set -eo pipefail

source modules/docker.sh

config=$([[ -e /app/jupyter/jupyter_notebook_config.py ]] && echo "jupyter_notebook_config.py" || echo "jupyter_notebook_config.default.py")
cp -f /app/jupyter/$config /home/jovyan/.jupyter/jupyter_notebook_config.py

start-notebook.sh
