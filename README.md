# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | date     | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| description | text      | null: false |
| category_id | integer   | null: false |
| status_id   | integer   | null: false |
| shipping_id | integer   | null: false |
| area_id     | integer   | null: false |
| day_id      | integer   | null: false |
| price       | integer   | null: false |
| user_id     | reference | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| municipality   | string  | null: false |
| number         | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :order