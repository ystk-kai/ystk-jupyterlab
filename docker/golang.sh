#!/usr/bin/env bash

set -eo pipefail

apt-get update
apt-get install -y apt-transport-https ca-certificates gnupg lsb-release
apt-get clean

GO111MODULE=off go get -d -u github.com/gopherdata/gophernotes

cd "$GOPATH/src/github.com/gopherdata/gophernotes"
env GO111MODULE=on go install

mkdir -p "/usr/local/share/jupyter/kernels/gophernotes"
cp kernel/* "/usr/local/share/jupyter/kernels/gophernotes"

cd "/usr/local/share/jupyter/kernels/gophernotes"
chmod +w "./kernel.json"
sed "s|gophernotes|$GOPATH/bin/gophernotes|" < kernel.json.in > kernel.json
