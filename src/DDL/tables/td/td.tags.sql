-- タグテーブル（ユーザーごとの自由タグ）
CREATE TABLE IF NOT EXISTS td.tags (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	name	VARCHAR(100)			NOT NULL,

	user_id	UUID				NOT NULL,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (user_id) REFERENCES usr.users(id),

	UNIQUE (user_id, name)
);
