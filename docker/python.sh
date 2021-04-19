#!/usr/bin/env bash

set -eo pipefail

conda update --quiet --yes -n base -c defaults conda
conda update --quiet --yes --all -c conda-forge conda
conda install --quiet --yes -c conda-forge python=3.9
