---
description: "SQL ファイル編集時に適用。PostgreSQL の SQL コーディング規約、命名規則、フォーマットルールを定義。Use when: SQL を記述・修正するとき。"
applyTo: "**/*.sql"
---

# SQL 一般コーディング規約

## キーワード

- SQL キーワードはすべて **大文字** で記述する
  - 例: `CREATE TABLE`, `ALTER TABLE`, `NOT NULL`, `DEFAULT`, `PRIMARY KEY`, `REFERENCES`

## 識別子

- テーブル名・カラム名・スキーマ名は **小文字スネークケース** を使用する
  - 良い例: `user_info`, `created_at`, `todo_items`
  - 悪い例: `UserInfo`, `createdAt`, `TodoItems`

## フォーマット

- インデントは **タブ（幅 8）**
- 文末は必ず **セミコロン（`;`）** で終端する
- `CREATE` 文には `IF NOT EXISTS` を付与する
- `DROP` 文には `IF EXISTS` を付与する

## コメント

- SQL コードのコメントは **日本語** で記述する
- 単一行コメントは `--` を使用する
- セクション区切りなど長いコメントは `/* */` を使用する

## データ型

- 主キーは `UUID` 型、デフォルト `uuid_generate_v4()` を使用する
- 外部キーは `UUID` 型で統一する
- タイムスタンプは `TIMESTAMP WITH TIME ZONE` を使用する
- 文字列は用途に応じて `VARCHAR(n)` を使用する
