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

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_name_kana    | string | null: false             |
| last_name_kana     | string | null: false             |
| birth_year         | integer| null: false             |
| birth_month        | integer| null: false             |
| birth_day          | integer| null: false             |

- has_many :items
- has_many :orders


## items テーブル

| Column     | Type      | Options                       |
| ------     | ------    | ------------------------------|
| name       | string    | null: false                   |
| explanation| text      | null: false                   |
| category   | string    | null: false                   |
| user       | references| null: false, foreign_key: true|
| situation  | string    | null: false                   |
| load       | string    | null: false                   |
| area       | string    | null: false                   |
| days       | string    | null: false                   |
| price      | integer   | null: false                   |


- belongs_to :user
- has_many :orders



## orders テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| destination | references | null: false, foreign_key: true |
| card        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :destination
- belongs_to :card
- belongs_to :item

## destinations テーブル


| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| code               | integer| null: false             |
| prefecture         | string | null: false             |
| city               | string | null: false             |
| address            | string | null: false             |
| building           | string |                         |
| phone_number       | integer| null: false             |

- has_many :orders

## cards テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| number             | integer| null: false             |
| month              | integer| null: false             |
| year               | integer| null: false             |
| security           | integer| null: false             |

- has_many :orders
