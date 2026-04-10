---
description: "プロジェクト規約に準拠した CREATE INDEX 文を生成する"
agent: "agent"
argument-hint: "スキーマ名.テーブル名 とインデックス対象カラム（例: usr.users email, username）"
---

以下の手順でインデックス DDL を生成してください:

1. 入力されたテーブル名とカラム情報を解析する
2. 対象テーブルの DDL を `src/DDL/tables/` から読み取り、カラム定義を確認する
3. インデックス命名規則に従う: `idx_スキーマ名_テーブル名_カラム名`
4. ユニークインデックスの場合は `uniq_` プレフィックスを使用する
5. 論理削除パターンに対応するため、`WHERE deleted_at IS NULL` の部分インデックスを推奨する
6. 生成した SQL ファイルを `src/DDL/index/スキーマ名/スキーマ名.テーブル名.sql` に配置する
7. SQL コメントは日本語で記述する
