#!/usr/bin/env bash

set -eo pipefail

apt-get update
apt-get install --no-install-recommends -y jq
apt-get clean

# curl
wget -O /usr/local/bin/curl https://github.com/moparisthebest/static-curl/releases/download/v7.76.1/curl-amd64
chmod 755 /usr/local/bin/curl
