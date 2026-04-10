# プロジェクトガイドライン

## プロジェクト概要

PostgreSQL を使用した TODO アプリケーションのデータベース定義（DDL）リポジトリ。

- **RDBMS**: PostgreSQL
- **エンコーディング**: UTF-8（`LC_COLLATE = 'ja_JP.UTF-8'`, `LC_CTYPE = 'ja_JP.UTF-8'`）
- **タイムゾーン**: `Asia/Tokyo`
- **UUID 生成**: `uuid-ossp` 拡張を使用

## スキーマ構成

| スキーマ | 役割 | 説明 |
|---|---|---|
| `usr` | ユーザー管理 | ユーザーアカウント・プロフィール情報 |
| `td` | TODO 管理 | TODO タスクの保存・管理 |
| `rl` | ロール管理 | 権限・ロール定義 |
| `pr` | パーミッション管理 | 権限（パーミッション）定義 |

## ディレクトリ構造

```
src/DDL/
├── database/       # データベース作成 SQL
├── extentions/     # PostgreSQL 拡張の有効化
├── schemas/        # スキーマ作成 SQL
├── tables/         # テーブル定義（スキーマ名ごとのサブディレクトリ）
│   ├── usr/        # usr スキーマのテーブル
│   ├── td/         # td スキーマのテーブル
│   ├── rl/         # rl スキーマのテーブル
│   └── pr/         # pr スキーマのテーブル
└── index/          # インデックス定義（スキーマ名ごとのサブディレクトリ）
    ├── usr/
    ├── td/
    ├── rl/
    └── pr/
```

## ファイル命名規則

- テーブル定義: `スキーマ名.テーブル名.sql`（例: `usr.users.sql`）
- インデックス定義: `スキーマ名.テーブル名.sql`（例: `usr.users.sql`）
- スキーマ定義: `スキーマ名.sql`（例: `usr.sql`）

## SQL コーディング規約

- **キーワード**: 大文字（`CREATE TABLE`, `NOT NULL`, `DEFAULT` 等）
- **識別子**: 小文字スネークケース（`user_info`, `created_at`）
- **文末**: セミコロン（`;`）で終端
- **存在チェック**: `IF NOT EXISTS` / `IF EXISTS` を使用
- **インデント**: タブ（幅 8）
- **主キー**: 各テーブルで `id UUID PRIMARY KEY DEFAULT uuid_generate_v4()` を使用
- **外部キー参照**: UUID 型で統一

## 共通カラムパターン

全テーブルに以下の監査カラムを含める（[usr.users](src/DDL/tables/usr/usr.users.sql) を参照）:

```sql
-- 監査カラム（必須）
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	created_by UUID NOT NULL,
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_by UUID NOT NULL,

	-- 論理削除カラム（必須）
	deleted_at TIMESTAMP WITH TIME ZONE,
	deleted_by UUID
```

- `created_at` / `updated_at`: タイムゾーン付きタイムスタンプ、`NOT NULL`、デフォルト `NOW()`
- `created_by` / `updated_by`: 操作者の UUID、`NOT NULL`
- `deleted_at` / `deleted_by`: 論理削除用、`NULL` 許容（削除されていない場合は `NULL`）

## 応答規約

- 日本語で応答すること
- SQL コードのコメントは日本語で記述すること