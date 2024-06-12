# テーブル設計

## usersテーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |  
| nickname    | string | null: false               |
| email       | string | null: false, unique: true |
| password    | string | null: false               |
| familyname  | string | null: false               |
| firstname   | string | null: false               |
| birthyear   | string | null: false               |
| birthmonth  | string | null: false               |
| birthday    | string | null: false               |


### Association

has_many: items
has_many: comments

## itemsテーブル

| Column      | Type   | Options                        |
| ----------- | ------ | ------------------------------ |  
| name        | string | null: false                    |
| explanation | text   | null: false, unique: true      |
| category    | string | null: false                    |
| state       | string | null: false                    |
| payer       | string | null: false                    |
| fromwhere   | string | null: false                    |
| period      | string | null: false                    |
| price       | string | null: false                    |
| user        | string | null: false, foreign_key: true |

### Association

belongs_to: user
has_many: items


## commentsテーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |  
| content     | text   | null: false               |
| item        | string | null: false, unique: true |
| user        | string | null: false, unique: true |

### Association

belongs_to: user
belongs_to: item


