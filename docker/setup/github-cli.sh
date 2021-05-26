#!/usr/bin/env bash

set -eo pipefail

curl -LO https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/gh_${GITHUB_CLI_VERSION}_linux_amd64.tar.gz

tar -zxvf gh_${GITHUB_CLI_VERSION}_linux_amd64.tar.gz
mv gh_${GITHUB_CLI_VERSION}_linux_amd64 /usr/local/gh

rm -rf gh_${GITHUB_CLI_VERSION}_linux_amd64.tar.gz
