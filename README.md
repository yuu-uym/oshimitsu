# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
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
