# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル

| Column          | Type         | Options                        |
| ------          | ------       | -----------                    |
| item_name       | string       | null: false                    |
| description     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| status_id       | integer      | null: false                    |
| shipping_fee_id | integer      | null: false                    |
| region_id       | integer      | null: false                    |
| shipping_day_id | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |



### Association

- has_many :comments
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                                    |
| -------     | ---------- | ------------------------------             |
| user        | references | null: false, foreign_key: true             |
| item        | references | null: false, foreign_key: true             |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery



## deliveries テーブル

| Column        | Type       | Options                         |
| -------       | ---------- | ------------------------------  |
| purchase      | references |  null: false, foreign_key: true |
| postcode      | string     |  null: false                    |
| prefecture_id | integer    |  null: false                    |
| city          | string     |  null: false                    |
| house_number  | string     |  null: false                    |
| building      | string     |                                 |
| phone         | string     |  null: false                    |


### Association
- has_one :purchase



## comments テーブル

| Column      | Type       | Options                         |
| -------     | ---------- | ------------------------------  |
| user        | references |  null: false, foreign_key: true |
| item        | references |  null: false, foreign_key: true |
| content     | text       |                                 |


### Association

- belongs_to :user
- belongs_to :item