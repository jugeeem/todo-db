-- TODO カテゴリテーブル（ユーザーごとのカテゴリ分類）
CREATE TABLE IF NOT EXISTS td.categories (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	name		VARCHAR(100)			NOT NULL,
	description	TEXT,

	user_id		UUID				NOT NULL,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (user_id) REFERENCES usr.users(id),

	UNIQUE (user_id, name)
);
