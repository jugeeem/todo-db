CREATE INDEX IF NOT EXISTS idx_usr_users_email_active
	ON usr.users (email)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_usr_users_username_active
	ON usr.users (username)
	WHERE deleted_at IS NULL;
