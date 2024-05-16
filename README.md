# ACS動作環境簡単に作れるやつ

## 概要

* ACSの動作環境が簡単に作れます
* DockerおよびDocker Composeが必要です
* Linux・Unix環境が必要です

## 使い方

### 起動

```bash
 ./run.sh ./env/{起動したいバージョンのenvファイル} up
```

### 停止(コンテナ削除)

```bash
 ./run.sh ./env/{起動したいバージョンのenvファイル} down
```

### ボリューム削除

```bash
 ./run.sh ./env/{起動したいバージョンのenvファイル} clean
```

## アクセス

### Share

<http://localhost:8180/share>

### Repo

<http://localhost:8080/alfresco>

## jarファイルを追加する

docker-compose.ymlファイルのvolumesにサンプルがコメントとして記載されているので、これを参考にして記載してください。

## 新しいバージョンに対応する

env配下にある*.envを新しく作成してください。ただ、必ず"RICKSOFT_TEST_ACS_IDENTIFIER"を一意の値にするべきだという点についてご注意ください。

## 余談

Dockerfileを使えばもうちょっと融通が利きますが、ビルドするたびにImageが増えていく悲しみを背負ってしまうので、docker-compose.ymlのみで解決できる部分でやっています。
