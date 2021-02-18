# tech-memo
技術メモ

## 書いてほしいこと

- Dcokerについて
  - 紹介
  - サンプルプロジェクトによる基本的な使い方の説明
  - ノウハウ、レシピ的な
- GitHub Actionsについて
  - 紹介
  - サンプルプロジェクトによる基本的な使い方の説明
  - ノウハウ、レシピ的な

読み手のターゲットは、DockerやGitHub Actionsを知らない人、何に使えるか分かってない人です。

書き出すとキリがないので、LinuxやGitについては知っている前提で記載をお願いします。
必要なら別途作成することにしましょう。  


各ページには、以下を必ず記載して下さい。
（何か自動で埋め込む仕組みがあると嬉しいですね）

- 作成日、更新日

また、動作確認を伴うページには、以下を必ず記載して下さい。

- OS（Win10はビルドバージョンまで）
- ツール（Dockerなど）のバージョン


### Docker
-----------------------------------------------------------

#### Dockerの紹介
ページ冒頭でDockerの概要、こんなときに使えるみたいな説明を書いて下さい。  

知らない人が読んで使ってみたいと思わせられたら完璧です。

詳しい説明は参考ページへリンクをとばす形でいいです。

<br />

#### Dockerのサンプルプロジェクト
例題を考えて、dockerの基本的な使い方を説明するページを作って下さい。  
複数ページに分けてOKです。

docker-composeについても記載お願いします。  

<br />

#### ノウハウ、レシピ的な
やりたいことから、解決策をすぐに見つけられるようなページを作りたいです。  
目次用のページを作って、ネタごとにページを分けるのが良いかと思います。

ひとまず思いつくネタは↓になります。  
分類、粒度など体系だてて整理してもらえると助かります。  

意味不明なところの詳細は井上まで。

- ホストPCのファイルをdockerビルド時に使いたい（COPY/ADD）
- docker build時に環境変数の値を設定したい（--build-arg/ARG/ENV）
- docker build時にキャッシュを使いたくない（--no-cache）
- docker run時に環境変数の値を設定したい（-e）
- コンテナをホストPCと同じネットワークに所属させたい（--net host）
- コンテナに名前を付けたい（--name）
- ホストPCのファイルをコンテナから参照したい
  - volume/bindについて
  - ホストPCとコンテナ内のユーザのIDが違う場合の対応方法
- コンテナ内のGUIツールを使いたい
  - X-Windowを使う方法（DISPLAY変数の設定）
  - VNCサーバを使う方法（結構大変なので、余裕があればで良いです）
- PROXY環境でも動くイメージを作りたい
  - ビルド環境にPROXYがある場合
  - コンテナ実行環境にPROXYがある場合
- PID1問題対策（tini, --init）
- ghcr.ioでDockerイメージを公開したい
  - Personal Access Tokenの作成方法（burger_war_devの手順書から持ってきても良いです）
  - ghcr.ioへのログインとプッシュ
  - 公開方法（private→publicにする）

サンプルプロジェクトを作る際に疑問に思った箇所や、引っかかった箇所はどんどん追加して下さい。

<br />

### GitHub Actions
-----------------------------------------------------------

#### GitHub Actionsの紹介
ページ冒頭でDockerの概要、こんなときに使えるみたいな説明を書いて下さい。

知らない人が読んで使ってみたいと思わせられたら完璧です。

詳しい説明は参考ページへリンクをとばす形でいいです。

公式ドキュメントは用意されてますが、若干探しにくいので、よく見そうなページへのリンク集があると良いかもです。  
Microsoftより断然マシですが。

<br />

#### GitHub Actionsのサンプルプロジェクト
例題を考えて、GitHub Actionsの基本的な使い方の説明ページを作って下さい。  

複数ページに分けてOKです。


<br />

#### ノウハウ、レシピ的な
やりたいことから、解決策をすぐに見つけられるようなページを作りたいです。  
目次用のページを作って、ネタごとにページを分けるのが良いかと思います。  

ひとまず思いつくネタは↓になります。  
分類、粒度など体系だてて整理してもらえると助かります。  

意味不明なところの詳細は井上まで。

- ローカルでGitHub Actionsの動作確認をしたい（何かあるらしいです）
  - for Linux
  - for Windows
    - Linux / Windows共通で使えるものがあればそれが好ましいです
    - Macは知らん
- Readmeの目次を自動更新したい（technote-space/toc-generator）
- GitHub Actionsでビルドした成果物（exeなど）を保存したい
  - artifact
  - packages
- Dockerとの連携
  - Dockerfileをビルドしたい
  - GitHub Actionsからghcr.ioへDockerイメージをプッシュしたい
- 定期的に処理を実行したい（cron）

サンプルプロジェクトを作る際に疑問に思った箇所や、引っかかった箇所はどんどん追加して下さい。

<br />

## ファイル構成
以下のような構成をイメージしています。  
何か不都合があれば変えてもらってOKです。

ただ、保守が辛くなるので巨大なファイルを作るのは避けたいなと思ってます。  

```
src/index.adoc                  全体の目次
src/docker/index.adoc           dockerの目次ファイル
src/docker/*.adoc               dockerの各ドキュメントファイル
src/github-actions/index.adoc   Github Actionsの目次ファイル
src/github-actions/*.adoc       Github Actionsの各ドキュメントファイル
```

adocを変換したファイルは、同じディレクトリ構成で全て拡張子がhtmlになるイメージです。  
今のworkflowでは、成果物がGitHubのArtifactという期間限定の保存領域に出力されます。  
成果物(html)用のフォルダかリポジトリを作ってそこにプッシュするか、Packagesに保存するような形に変えたほうが良さそうな気がしてます。

## GitHub Artifactについて
Github Actionの成果物が標準で出力される期間限定(90日間)の領域

該当のGithub Actionの一番下に以下のような形で作成される。

 ![GitHub Artifact](https://docs.github.com/assets/images/help/repository/passing-data-between-jobs-in-a-workflow-updated.png "GitHub Artifact")

 詳細は下記参照
```
https://docs.github.com/ja/actions/guides/storing-workflow-data-as-artifacts
```
 