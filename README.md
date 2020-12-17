# README

## Usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | unique: true                    |
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
| user      | references | foreign_key: true              |
| goods     | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :goods
- has_one :home


## homesテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| address       | string        | foreign_key: true              |
| city_id       | integer       | null: false                    |
| municipality  | text          | null: false                    |
| street        | string        | null: false                    |
| number        | string        | null: false                    |
| building      | string        |                                |


### Association
- belongs_to :buy



## goodsテーブル

| Column       | Type              | Options                        |
| ------------ | ----------------- | ------------------------------ |
| name         | string            | null: false                    |
| image        | string            | null: false                    |
| text         | text              | null: false                    |
| category_id  | integer           | null: false                    |
| delivery_id  | integer           | null: false                    |
| status_id    | integer           | null: false                    |
| city_id      | integer           | null: false                    |
| days_id      | integer           | null: false                    |
| price        | integer           | null: false                    |
| user         | references        | foreign_key: true              |

##　Association
- has_one :buy
- belongs_to :user
