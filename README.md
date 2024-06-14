# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |  
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| familyname_kanji   | string | null: false               |
| firstname_kanji    | string | null: false               |
| familyname_kana    | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

has_many: items
has_many: records

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| payer_id      | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| period_id     | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to: user
has_one: record

## buyersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| record         | references | null: false, foreign_key: true |

### Association

belongs_to: record

## recordsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |  
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item
has_one: buyer