# README

## Usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | nul : false                    |

### Association
- has_many :buys
- has_many :goods


## buysテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | foreign_key: true              |
| name      | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :goods
- has_one :homes


## homesテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| address       | string        | foreign_key: true              |
| city          | ActiveStorage | null: false                    |
| municipality  | text          | null: false                    |
| street        | string        | null: false                    |
| number        | string        | null: false                    |


### Association
- belongs_to :buys



## goodsテーブル

| Column       | Type              | Options                        |
| ------------ | ----------------- | ------------------------------ |
| name         | string            | null: false                    |
| image        | ActiveStorage     | null: false                    |
| text         | text              | null: false                    |
| category_id  | integer           | null: false                    |
| delivery_id  | integer           | null: false                    |
| status_id    | integer           | null: false                    |
| area_id      | integer           | null: false                    |
| days_id      | integer           | null: false                    |
| price        | integer           | null: false                    |
| user_id      | references        | null: false                    |

##　Association
- has_one :buys
- belongs_to :user
