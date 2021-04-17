#!/usr/bin/env bash

set -eo pipefail

apt-get update
apt-get install --no-install-recommends -y cmake build-essential
apt-get clean

curl -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
rustup component add rust-src
cargo install evcxr_jupyter
evcxr_jupyter --install
