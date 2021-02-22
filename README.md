# テーブル設計

## usersテーブル

| Column          | Type   | Options                    |
| --------------- | ------ | -------------------------- |
| nickname        | string | null: false                |
| email           | string | null: false                |
| password        | string | null: false                |
| last_name       | string | null: false                |
| first_name      | string | null: false                |
| last_name_kana  | string | null: false                |
| first_name_kana | string | null: false                |
| birth_year_id   |        | null: false, (active_hash) |
| birth_month_id  |        | null: false, (active_hash) |
| birth_day_id    |        | null: false, (active_hash) |



### Association

- has_many :itmes
- has_one :buys


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        |            | null: false, (active_hash)     |
| condition_id       |            | null: false, (active_hash)     |
| shopping_charge_id |            | null: false, (active_hash)     |
| shopping_area_id   |            | null: false, (active_hash)     |
| day_to_ship_id     |            | null: false, (active_hash)     |
| price              | integer    | null: false, (active_hash)     |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buys


## buysテーブル

| Column      | Type       | Options                        |
| ------------| ---------- | -------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| buyer_info  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_info


## buyer_infoテーブル

| Column         | Type    | Options     |
| ---------------| ------- | ----------- |
| card_number    | integer | null: false |
| card_exp_month | integer | null: false |
| card_exp_year  | integer | null: false |
| card_cvc       | integer | null: false |
| postal_code    | integer | null: false |
| prefectures_id | integer | null: false |
| municipality   | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| phone_number   | integer | null: false |

### Association

- belongs_to :buy
