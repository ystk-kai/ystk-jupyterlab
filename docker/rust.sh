#!/usr/bin/env bash

set -eo pipefail

curl -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
rustup component add rust-src
cargo install evcxr_jupyter
evcxr_jupyter --install
