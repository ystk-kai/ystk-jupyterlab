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

## Features

- Jupyter の設定を変更可能
    - `jupyter/jupyter_notebook_config.default.py` を `jupyter/jupyter_notebook_config.py` にコピーする。
- 拡張機能の有効性を保持
    - コンテナ削除後も追加した拡張機能を保持します。
- ポート変更・Jupyter のルートディレクトリ位置の変更用のテンプレートを用意
    - `docker-compose.override.sample.yml` を `docker-compose.override.yml` にコピーする。
- ビルド済みイメージの簡易取得
    - Docker ビルドを短縮するため、コンテナレジストリから簡単に取得できる。
    - サポート対象の言語カーネルなどが増えた場合、更にビルド時間が増えるため。

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

初期値の Jupyter のルートディレクトリは `./notebooks` となる。

## Documents

- [Tips](https://github.com/ystk-kai/ystk-jupyterlab/wiki/Tips)
