CREATE TABLE IF NOT EXISTS usr.user_info (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	first_name	VARCHAR(256) 	NOT NULL,
	last_name	VARCHAR(256) 	NOT NULL,
	bio		TEXT,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	user_id		UUID	NOT NULL 	UNIQUE,

	FOREIGN KEY (user_id) REFERENCES usr.users(id)
);
