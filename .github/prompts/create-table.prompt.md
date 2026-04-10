---
description: "プロジェクト規約に準拠した CREATE TABLE 文を生成する"
agent: "agent"
argument-hint: "スキーマ名.テーブル名 とカラム定義（例: td.todos タイトル、説明、ステータス、期限）"
---

以下の手順でテーブル DDL を生成してください:

1. 入力されたスキーマ名・テーブル名・カラム情報を解析する
2. [AGENTS.md](../../AGENTS.md) のプロジェクト規約を遵守する
3. [usr.users](../../src/DDL/tables/usr/usr.users.sql) テーブルの構造をテンプレートとして使用する
4. 以下の必須要素を含めること:
   - `id UUID PRIMARY KEY DEFAULT uuid_generate_v4()`
   - ビジネスカラム（入力に基づく）
   - 監査カラム（`created_at`, `created_by`, `updated_at`, `updated_by`）
   - 論理削除カラム（`deleted_at`, `deleted_by`）
5. 生成した SQL ファイルを `src/DDL/tables/スキーマ名/スキーマ名.テーブル名.sql` に配置する
6. SQL コメントは日本語で記述する
