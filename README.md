# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |  
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| familyname         | string | null: false               |
| firstname          | string | null: false               |
| birthday           | date   | null: false               |

### Association

has_many: items
has_many: records

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | integer    | null: false                    |
| state       | integer    | null: false                    |
| payer       | integer    | null: false                    |
| fromwhere   | integer    | null: false                    |
| period      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

belongs_to: user
has_many: buyers
has_many: records

## buyersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | integer    | null: false                    |
| building    | string     |                                |
| phone_number| integer    | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association

belongs_to: item

## recordsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |  
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item