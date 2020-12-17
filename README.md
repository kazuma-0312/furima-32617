# README

## Usersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| email         | string     | null: false                    |
| password      | string     | null: false                    |
| nickname      | string     | null: false                    |


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

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| name      | string        | foreign_key: true              |
| image     | ActiveStorage | null: false                    |
| text      | text          | null: false                    |
| category  | string        | null: false                    |
| delivery  | string        | null: false                    |
| area      | string        | null: false                    |
| days      | date          | null: false                    |
| price     | string        | null: false                    |
| user_id   | references    | null: false                    |

##　Association
- has_one :buys
- belongs_to :user
