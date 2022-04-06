# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

- has_many :prototypes
- has_many :customer

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | text       | null: false                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_day  | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

- belongs_to :users
- has_one :customer

## customer テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | string     | null: false                    |
| card_expire_date | string     | null: false                    |
| card_cord        | string     | null: false                    |
| product          | references | null: false, foreign_key: true |
| shipping         | references | null: false, foreign_key: true |
| buyer_id         | integer    | null: false                    |

- belongs_to :products
- belongs_to :users
- has_one :shipping

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| customer      | references | null: false, foreign_key: true |

- belongs_to :customer