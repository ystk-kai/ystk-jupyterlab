# Ystk JupyterLab

[![Push Container Image](https://github.com/ystk-kai/ystk-jupyterlab/actions/workflows/push-container-image.yml/badge.svg?branch=master)](https://github.com/ystk-kai/ystk-jupyterlab/actions/workflows/push-container-image.yml)

JupyterLab に [Support Languages](#support-languages) 内の言語カーネルと [Support Commands](#support-commands) のコマンドラインツールを追加した Docker 環境を構築します。

## Support Languages

- [C++](https://isocpp.org/)
- [Go](https://golang.org/)
- [Java](https://www.java.com/ja/)
- [Kotlin](https://kotlinlang.org/)
- [Python](https://www.python.org/)

## Support Commands

- [Gradle](https://gradle.org/)
- [jq](https://stedolan.github.io/jq/)
- [GitHub CLI](https://github.com/cli/cli)

## Usage

```bash
# Docker イメージを取得
docker-compose run pull

# JupyterLab を起動
docker-compose up -d

# ブラウザで以下の URL にアクセス
# http://localhost:8888

# JupyterLab を停止
docker-compose down
```

Notebook ファイルは `./notebooks` に保存される。

## Documents

- [Tips](wiki/Tips)
