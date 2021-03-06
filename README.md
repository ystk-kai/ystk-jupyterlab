# Ystk JupyterLab

[![Push Container Image](https://github.com/ystk-kai/ystk-jupyterlab/actions/workflows/push-container-image.yml/badge.svg?branch=master)](https://github.com/ystk-kai/ystk-jupyterlab/actions/workflows/push-container-image.yml)

JupyterLab に [Support Languages](#support-languages) 内の言語カーネルと [Support Packages](#support-packages) を追加した Docker 環境を構築します。

## Support Languages

- [C#](https://docs.microsoft.com/en-us/dotnet/csharp/)
- [C++](https://isocpp.org/)
- [F#](https://fsharp.org/)
- [Go](https://golang.org/)
- [Java](https://www.java.com/ja/)
- [JavaScript(Node.js)](https://nodejs.org/ja/)
- [Julia](https://julialang.org/)
- [Kotlin](https://kotlinlang.org/)
- [Lua](https://www.lua.org/)
- [Python](https://www.python.org/)
- [R](https://www.r-project.org/)
- [Rust](https://www.rust-lang.org/)
- [TypeScript](https://www.typescriptlang.org/)

## Support Packages

- [GitHub CLI](https://github.com/cli/cli)
- [Gradle](https://gradle.org/)
- [jq](https://stedolan.github.io/jq/)

## Features

- Jupyter の設定を変更可能
    - `jupyter/jupyter_notebook_config.default.py` を `jupyter/jupyter_notebook_config.py` にコピーして設定してください。
- 拡張機能の有効性を保持
    - コンテナ削除後も追加した拡張機能を保持します。
- ポート変更・Jupyter のルートディレクトリ位置の変更用のテンプレートを用意
    - `docker-compose.override.sample.yml` を `docker-compose.override.yml` にコピーして設定してください。
- ビルド済みイメージの取得
    - Docker ビルドを短縮するため、コンテナレジストリからの取得を推奨。
    - サポート対象の言語カーネルなどが増えた場合、更にビルド時間が増えるため。

## Usage

実行には [Docker](https://docs.docker.com/get-docker/) 環境が必要となります。

```bash
# コードの取得
git clone git@github.com:ystk-kai/ystk-jupyterlab.git

# プロジェクト内に移動
cd ystk-jupyterlab

# Docker イメージを取得
# ローカルでビルドする場合は docker-compose build を実行
docker-compose run pull

# JupyterLab を起動
docker-compose up -d

# ブラウザで以下の URL にアクセス
# http://localhost:8888

# JupyterLab を停止
docker-compose down
```

初期値の Jupyter のルートディレクトリは `./notebooks` です。

⚠️`jupyter/jupyter_notebook_config.default.py` はトークンとパスワードを無効にしています。  
外部に公開する場合は、 `jupyter_notebook_config.py` を配置して適切に設定してください。

## Initialize

docker ボリュームにユーザデータや Extension Manager で追加した拡張機能を格納しているため、初期化する場合は以下のコマンドを実施してください。

```bash
docker-compose down --volumes
```

## Container Image

- [Docker Hub](https://hub.docker.com/r/ystkkai/ystk-jupyterlab)
- [GitHub](https://github.com/ystk-kai/ystk-jupyterlab/packages/)

## Documents

- [Tips](https://github.com/ystk-kai/ystk-jupyterlab/wiki/Tips)
