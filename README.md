# アプリケーション名
ゲーム画像置き場

# 概要
ログインとログアウト機能をつけてログインしてる人だけ画像や文字の投稿や削除をできるようにしました。
それと一度の投稿で複数の画像投稿と画像のプレビュー機能も付けました。
後はTwitterのタイムラインを埋め込んで、自分のTwitterへの投稿を直ぐに反映できるようにしました。

# 本番環境
http://18.180.190.164/

### Basic認証
ID: admin
Pass: 2222

### テスト用アカウント
メールアドレス: sa@sa
パスワード: sasasa

# 制作背景(意図)
自分用にとにかく一度で大量のゲーム画像を貼りまくって、ゲーム好きな人たちや知り合いの範囲で見せびらかす意図で作ってみました。

まず、Twitterのタイムラインを埋め込んだ理由は、プレイステーション４や５などで撮ったスクリーンショットは画像共有機能を使えばすぐにTwitterに画像を投稿できます。
そして、その画像はこのアプリに埋め込んであるTwitterのタイムラインに反映されるので、ダウンロードすることができます。
Twitterにアップロードしすぎるだけだと一つ一つの画像が小さくはなく、下に長くなりすぎてしまうので、あえてこのアプリの画像はかなり小さくしました。

主にプレイステーション４でスクリーンショットをたくさん撮って、Twitterに上げた画像をこのアプリを使って自分で大量に貼るのを目的とはしていますが、ログインしてる人なら画像投稿はできますし、Twitterのタイムラインを見ればゲーム画像しかない上にアプリ名のタイトルを見ればすぐわかると思うので、好きなゲーム画像をばるのにも使えます。

# DEMO
https://gyazo.com/ea5b8420ff83b2c7683a291879767923


# 工夫したポイント


# 使用技術(開発環境)
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / AWS S3 / Visual Studio Code / Trello

# 実装予定の機能


# DB設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique :true |
| encrypted_password | string  | null: false               |

### Association

- has_many :messages

## messages テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| content          | string     | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user