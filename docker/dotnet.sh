#!/usr/bin/env bash

set -eo pipefail

# https://github.com/dotnet/core/tree/main/release-notes
wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/ef13f9da-46dc-4de9-a05e-5a4c20574189/be95913ebf1fb6c66833ca40060d3f65/dotnet-sdk-5.0.203-linux-x64.tar.gz
wget -O dotnet_runtime.tar.gz https://download.visualstudio.microsoft.com/download/pr/4a7f1f6c-6777-42c4-9793-581bba4b632e/e03e6237a8f49f60014d459f0f758923/aspnetcore-runtime-5.0.6-linux-x64.tar.gz

tar zxf dotnet.tar.gz -C "/usr/share/dotnet"
rm dotnet.tar.gz

tar zxf dotnet_runtime.tar.gz -C "/usr/share/dotnet"
rm dotnet_runtime.tar.gz

ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
dotnet help

dotnet tool install --tool-path /jovyan/.dotnet/tools --add-source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-tools/nuget/v3/index.json" Microsoft.dotnet-interactive
dotnet interactive jupyter install
