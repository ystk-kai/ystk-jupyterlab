#!/usr/bin/env sh

set -eo pipefail

cp -f /app/jupyter/jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

start-notebook.sh
