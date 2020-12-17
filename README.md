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
- has_many :items


## buysテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :item
- has_one :home


## homesテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| address       | string        | null: false                    |
| city_id       | integer       | null: false                    |
| municipality  | string        | null: false                    |
| street        | string        | null: false                    |
| number        | string        | null: false                    |
| building      | string        |                                |
| buys          | references    | foreign_key: true              |


### Association
- belongs_to :buy



## itemsテーブル

| Column       | Type              | Options                        |
| ------------ | ----------------- | ------------------------------ |
| name         | string            | null: false                    |
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
