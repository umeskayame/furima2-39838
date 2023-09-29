# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false | 
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birthday           | string | null: false |


### Association

- has_many :items
- has_many :purchases
- has_many :comments
- has_one :delivery


## items テーブル

| Column      | Type         | Options           |
| ------      | ------       | -----------       |
| item_name   | string       | null: false       |
| description | text         | null: false       |
| category    | string       | null: false       |
| status      | string       | null: false       |
| shipping_fee| string       | null: false       |
| shipping    | string       | null: false       |
| days        | string       | null: false       |
| price       | integer      | null: false       |
| user_id     | references   | foreign_key: true |



### Association

- has_many :comments
- has_one :purchase
- has_one :delivery
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user_id     | references |  foreign_key: true             |
| bought_item | string     |  null: false                   |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery



## deliveries テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user_id      | references |  foreign_key: true             |
| postcode     | string     |  null: false                   |
| prefecture   | string     |  null: false                   |
| city         | string     |  null: false                   |
| house_number | string     |  null: false                   |
| building     | string     |  null: false                   |
| phone        | string     |  null: false                   |


### Association

- belongs_to :user
- belongs_to :purchase
- belongs_to :item



## comments テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user_id     | references |  foreign_key: true             |
| item_id     | references |  foreign_key: true             |
| content     | text       |                                |


### Association

- belongs_to :user
- belongs_to :item