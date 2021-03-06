# README
# アプリケーション名
  Oshimitsu(推貢)

# 目指した課題解決	

##  ターゲット
  複数ジャンルに跨がるオタク。欲しいグッズやいきたいライブ、ソシャゲへの課金やイベントなどやりたいことがたくさんあって追いきれない。  
  一押しのキャラクターやジャンル（以下”推し”）に貢げることが幸せで、そんな自分をもっと愛したいと思っている。
##  課題 
  複数の推しがいる人がターゲットなので、推し毎にわけて考える。  
  推し毎のグッズ/ライブ/課金について  
- いつ何が出るのか、自分が「欲しい」と思っている度合いに応じたアイテムがすぐわかるようにまとめたい
- 月ごとの予算管理を行いたい (例)「今月はグッズがこんなに出るから課金はここまで」
- 使用感などの情報共有を気軽に行いたい
- 「こんなに推しに貢いだ」というある種の承認欲求を満たしたい
- Twitterに投稿することで、趣味が合う人をフォローして情報共有をしたい

# アプリケーション概要	
  - ユーザーはログイン後、推し＝ジャンルを自由に登録することができる。推しごとにアイコン画像と月額上限を設定できる
  - ジャンルの詳細ページで、アイテムを登録することができる  
    アイテム登録時には、商品名、カテゴリー、ステータス（欲しい度合い）、金額、発売日、購入日を合わせて登録できる  
    ※カテゴリーは「グッズ」「課金」「ライブ」などを開発者側で設定している
  - ユーザーは、自身がどれだけの金額を登録しているかの合計を確認することができる
    ※確認できる金額の詳細は、下記「洗い出した要件」内の「金額の表示機能」を参照のこと
  - アイテムは一覧で確認をすることができ、絞り込みを行うこともできる
  - 掲示板を気軽に作成、検索、書き込みができる


# URL	

# テスト用アカウント
  - email : example@gmail.com	
  - password : abcd1234


# 利用方法	

## トップページ
  - 新規登録/ログインページからログイン
  - ヘッダー「ジャンル追加」からジャンルの追加画面に遷移し、登録を行う
  - トップページ中段で金額の確認
  - トップページ下段の「ジャンル一覧」から、各ジャンルの詳細ページへ遷移
## ジャンル詳細ページ
  - 詳細ページの上段で、ジャンルの修正・削除・Twitterへのシェアを行う
  - 詳細ページ中段で金額の確認
  - 詳細ページ下段のアイテム一覧から、アイテムの追加・絞り込み・編集・削除を行う
## 掲示板ページ
  - ヘッダー「掲示板」から、掲示板の作成・検索・選択を行う
  - 掲示板詳細ページで書き込みを行う

# 洗い出した要件	

## ジャンル、アイテムの登録機能
  ユーザーが自由にジャンルの登録とジャンルに紐づくアイテムの登録を行うことができる。
  - ジャンル登録ページを実装。画像、テーマ、月額上限金額、URLを登録する。
  - ジャンル登録ページを実装。画像、テーマ、月額上限金額を登録する。
  - アイテム登録ページを実装。商品名、カテゴリー、ステータス（欲しい度合い）、金額、発売日、購入日を登録できる。
  - 発売日と購入日は任意だが、ステータスが「購入済み」の場合のみ、購入日の入力が必須。

## 金額の表示機能
  ユーザーがどれくらいの金額を利用したのかがわかるようにする。  
  アイテムを登録すると自動で金額が足し上げられ、トップページ及びジャンル詳細ページで金額の合計を確認することができる。  
  確認できる金額の内容は以下の通り。  
- 全てのジャンルに対して利用した合計の金額
- 全てのジャンルに対して利用した当月の金額
- 全てのジャンルに対して当月利用できる残金
- 全てのジャンルの「購入済み」合計の金額
- 全てのジャンルの「絶対欲しい」合計の金額
- 全てのジャンルの「気になる」合計の金額
- １つのジャンルに対して利用した合計の金額
- １つのジャンルに対して利用した当月の金額
- １つのジャンルに対して当月利用できる残金
- １つのジャンルの「購入済み」合計の金額
- １つのジャンルの「絶対欲しい」合計の金額
- １つのジャンルの「気になる」合計の金額

## Twitterへのシェア
  Twitterにシェアして、共通の趣味のフォロワーとのコミュニケーションを活性化させる。 
  - Twitterへのシェアリンクを実装。リンクをクリックすると、自身のTwitterの投稿画面にジャンプする。
  - 投稿内容には予め「ジャンル名」と「そのジャンルに対して当月に利用した金額」が表示される。

## 絞り込み機能
  ユーザーがアイテムの絞り込みを簡単に行うことができるようにする。  
  - アイテムは数点登録されていることが前提
  - カテゴリー/ステータス//値段を検索条件とし、指定する欄を儲ける
  - 条件に該当するのみを詳細ページで表示する

## 掲示板機能
  ユーザーが購入に迷った際や、同じ推しの人と会話したいときに気軽に使えるツール。
  - 掲示板作成機能を実装。テーマと概要を入力して投稿できる
  - 気になるワードで掲示板の絞り込みができる
  - 掲示板とコメントは、本人のみ削除ができる


# 実装した機能についてのGIFと説明	

## ジャンル、アイテムの登録機能
  Gif 推しの登録 https://gyazo.com/33e517e613770054059d6c3255705960
  Gif アイテムの登録 https://gyazo.com/9362ff7fe96039bc89877763a463f6cf
## 金額の表示機能
  gyazo 全ての金額 https://gyazo.com/6e8b3000aec2a7f3417965f84982e900
  gyazo 推しの金額 https://gyazo.com/de21d00d7c0cc91dbc91512938d077dc
## Twitterへのシェア
  Gif https://gyazo.com/b312b30d0e677a56e7e63ad2f754d0d2
## 絞り込み機能
  Gif https://gyazo.com/623c6a222c556117de9a5b0fc3d6a4a0
## 掲示板機能
  Gif https://gyazo.com/5399f653c8862f565e1285651c8d5013

# 実装予定の機能	
## SNS認証

# ローカルでの動作方法	

  git cloneしてから、ローカルで動作をさせるまでに必要なコマンド  
  % bundle install  
  % rails db:create  
  % rails db:migrate  
  Ruby on Rails のバージョン 6.0.0

# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :genres

## items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | -----------                    |
| name                 | string     | null: false                    |
| category_id          | integer    | null: false                    |
| price                | integer    | null: false                    |
| quantity_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| release_date         | integer    | null: false                    |
| purchase_date        | integer    | null: false                    |
| genre                | integer    | null: false,foreign_key: true  |
| user                 | references | null: false,foreign_key: true  | 

### Association

- belongs_to :user
- belongs_to :genre
- belongs_to_active_hash :category
- belongs_to_active_hash :quantity
- belongs_to_active_hash :status

## genre テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| theme            | string     | null: false                    |
| set_amount       |integer     |                                |
| user             | references | null: false,foreign_key: true  | 

### Association

- belongs_to :user
- has_many :items

## board テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | text       | null: false                    |
| overview         | text       | null: false                    |
| user             | references | null: false,foreign_key: true  | 

### Association

- belongs_to :user
- has_many :comments

## comment テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | text       | null: false                    |
| board            | references | null: false,foreign_key: true  | 
| user             | references | null: false,foreign_key: true  | 

### Association

- belongs_to :user
- belongs_to :board
