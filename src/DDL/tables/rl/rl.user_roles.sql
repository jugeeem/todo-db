-- ユーザーとロールの中間テーブル（多対多）
CREATE TABLE IF NOT EXISTS rl.user_roles (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	user_id	UUID	NOT NULL,
	role_id	UUID	NOT NULL,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (user_id) REFERENCES usr.users(id),
	FOREIGN KEY (role_id) REFERENCES rl.roles(id)
);
