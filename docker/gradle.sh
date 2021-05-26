#!/usr/bin/env bash

set -eo pipefail

curl -LO https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip

unzip -d /tmp gradle-$GRADLE_VERSION-bin.zip
mv /tmp/gradle-$GRADLE_VERSION /opt/gradle

rm -rf gradle-$GRADLE_VERSION-bin.zip
