# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique :true |
| encrypted_password | string  | null: false               |

### Association

- has_many :messages

## messages テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| content          | string     | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user