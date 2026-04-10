---
description: "インデックス DDL 作成・編集時に適用。命名規則、部分インデックスの推奨パターンを定義。Use when: CREATE INDEX 文を書くとき。"
applyTo: "src/DDL/index/**/*.sql"
---

# インデックス DDL 規約

## 命名規則

インデックス名は以下の形式に従うこと:

```
idx_スキーマ名_テーブル名_カラム名
```

- 複合インデックスの場合はカラム名をアンダースコアで連結する
- ユニークインデックスには `uniq_` プレフィックスを使用する

例:
```sql
-- 通常インデックス
CREATE INDEX IF NOT EXISTS idx_usr_users_email ON usr.users (email);

-- ユニークインデックス
CREATE UNIQUE INDEX IF NOT EXISTS uniq_usr_users_username ON usr.users (username);

-- 複合インデックス
CREATE INDEX IF NOT EXISTS idx_td_todos_user_id_status ON td.todos (user_id, status);
```

## 部分インデックス（推奨）

論理削除パターンを採用しているため、有効レコードのみを対象とする部分インデックスを推奨する:

```sql
-- 論理削除されていないレコードのみ対象
CREATE INDEX IF NOT EXISTS idx_usr_users_email_active
	ON usr.users (email)
	WHERE deleted_at IS NULL;
```

## ファイル配置

- `src/DDL/index/スキーマ名/スキーマ名.テーブル名.sql` に配置する
- 1 ファイルにつき 1 テーブル分のインデックスをまとめて定義する

## 注意事項

- 主キー（`id`）には自動でインデックスが作成されるため、明示的な定義は不要
- `UNIQUE` 制約にも自動でインデックスが作成されるため、重複して定義しない
