#!/usr/bin/env bash

set -eo pipefail

GO111MODULE=off go get -d -u github.com/gopherdata/gophernotes

cd "$GOPATH/src/github.com/gopherdata/gophernotes"
env GO111MODULE=on go install

mkdir -p "/usr/local/share/jupyter/kernels/gophernotes"
cp kernel/* "/usr/local/share/jupyter/kernels/gophernotes"

cd "/usr/local/share/jupyter/kernels/gophernotes"
chmod +w "./kernel.json"
sed "s|gophernotes|$GOPATH/bin/gophernotes|" < kernel.json.in > kernel.json
