# Ystk JupyterLab

JupyterLab に [Support Languages](#support-languages) 内の言語を追加した Docker 環境を構築します。

## Support Languages

- C++
- Go
- Java
- Kotlin
- Python

## Usage

```bash
# Docker イメージをビルド
docker-compose build

# JupyterLab を起動
docker-compose up -d

# ブラウザで以下の URL にアクセス
# http://localhost:8888

# JupyterLab を停止
docker-compose down
```

Notebook ファイルは `./notebooks` に保存される。

## Debug

```bash
# インタラクティブシェルでコンテナを起動
docker-compose run shell
```
