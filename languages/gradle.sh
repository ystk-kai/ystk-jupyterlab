#!/usr/bin/env bash

set -eo pipefail

curl -LO https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip

mkdir /opt/gradle
unzip -d /opt gradle-$GRADLE_VERSION-bin.zip
mv /opt/gradle-$GRADLE_VERSION /opt/gradle

rm -rf gradle-$GRADLE_VERSION-bin.zip
