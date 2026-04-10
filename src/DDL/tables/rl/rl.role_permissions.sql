CREATE TABLE IF NOT EXISTS rl.role_permissions (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	role_id		UUID	NOT NULL,
	permission_id	UUID	NOT NULL,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (role_id) REFERENCES rl.roles(id),
	FOREIGN KEY (permission_id) REFERENCES pr.permissions(id)
);
