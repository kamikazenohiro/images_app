# アプリケーション名
Twitter画像共有広場

# 概要
ログインとログアウト機能をつけてログインしてる人だけ画像と文字の投稿や削除をできるようにしました。<br>
ログインしてない人も投稿詳細ページを見ることは出来ます。<br>
後は一度の投稿で複数の画像投稿と画像のプレビュー機能も付けました。<br>
更にTwitterのタイムラインを埋め込んで、Twitterへの投稿をすぐに反映できるようにしました。<br>

# 本番環境
http://18.180.190.164/

### Basic認証
ID: admin<br>
Pass: 2222

### テスト用アカウント
メールアドレス: sa@sa<br>
パスワード: sasasa

# 制作背景(意図)
PS４や５の機能でTwitterにアップロードしたゲーム画像をたくさん貼って、ゲーム好きな人たちや知り合いの範囲で見せびらかす意図で作ってみました。

まず、Twitterのタイムラインを埋め込んだ理由として、PS４や５の機能で撮ったスクリーンショットは、画像共有機能を使えばすぐにTwitterに画像を投稿できます。<br>
そして、その画像はこのアプリに埋め込んであるTwitterのタイムラインに反映されるので、Twitterのタイムラインの画像を右クリックすれば、その画像をダウンロードすることができます。<br>
その後にアプリの複数投稿機能を使って、Twitterにアップロードしたたくさんの画像を小さくまとめておけます。<br>
このアプリの場合は小さくまとめる為に、投稿詳細ページとTwitterの画像以外はかなり小さくしました。

主に自分用と仮定してゲーム画像を基準にしているのですが、ログインしてる人なら画像投稿はできますし、Twitterに上げられる画像ならゲーム画像以外を共有することもできます。

# DEMO

## トップページや投稿機能など
https://gyazo.com/b11290fc4bb48fff6ef2df0569e24f58


# 工夫したポイント
画像を一度に複数投稿する場合は、プレビュー機能があった方がいいと思って付けました。<br>
後は画像の大きさは最後まで悩みましたが、自分ではこれぐらいの大きさがいいと思いました。

# 使用技術(開発環境)
Ruby, Ruby on Rails / HTML, CSS, javascript / MySQL, Sequel Pro / GitHub / AWS EC2, Capistrano, nginx, unicorn / Visual Studio Code /

# 課題
投稿画面での画像投稿時に、２枚目以降のファイルを選択時に毎回新しく出てきたファイルを選択を選ばないと、エラーは出ないものの挙動がおかしくなる。<br>
スマホで見た場合、色々と小さすぎるのでレスポンシブデザインを導入したい。

# 今後実装したい機能
・エラーメッセージの日本語化<br>
・ユーザーの詳細表示機能

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
