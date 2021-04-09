#!/usr/bin/env sh

set -eo pipefail

config=jupyter_notebook_config.default.py

if [[ -e /app/jupyter/jupyter_notebook_config.py ]]; then
    config=jupyter_notebook_config.py
fi

cp -f /app/jupyter/$config /home/jovyan/.jupyter/$config

start-notebook.sh
