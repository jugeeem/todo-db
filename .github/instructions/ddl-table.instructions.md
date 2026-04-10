---
description: "テーブル DDL 作成・編集時に適用。必須カラムパターン（UUID 主キー、監査カラム、論理削除）を定義。Use when: CREATE TABLE 文を書くとき。"
applyTo: "src/DDL/tables/**/*.sql"
---

# テーブル DDL 規約

## リファレンス実装

[usr.users](../../src/DDL/tables/usr/usr.users.sql) テーブルを規約の基準テンプレートとする。

## 必須構造

すべてのテーブルは以下の構造に従うこと:

```sql
CREATE TABLE IF NOT EXISTS スキーマ名.テーブル名 (
	-- 主キー（必須）
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

	-- ビジネスカラム（テーブル固有）
	...

	-- 監査カラム（必須）
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	created_by UUID NOT NULL,
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_by UUID NOT NULL,

	-- 論理削除カラム（必須）
	deleted_at TIMESTAMP WITH TIME ZONE,
	deleted_by UUID
);
```

## カラム順序

1. `id`（主キー）
2. ビジネスカラム（テーブル固有のカラム）
3. 外部キーカラム（ある場合）
4. 監査カラム（`created_at`, `created_by`, `updated_at`, `updated_by`）
5. 論理削除カラム（`deleted_at`, `deleted_by`）

## 制約

- `NOT NULL` 制約を適切に設定する
- `UNIQUE` 制約はビジネスルールに応じて付与する
- 外部キーは `REFERENCES スキーマ名.テーブル名(id)` の形式で定義する

## ファイル配置

- `src/DDL/tables/スキーマ名/スキーマ名.テーブル名.sql` に配置する
- 1 ファイルにつき 1 テーブルの定義とする
