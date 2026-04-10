CREATE INDEX IF NOT EXISTS idx_usr_user_info_last_name_first_name_active
	ON usr.user_info (last_name, first_name)
	WHERE deleted_at IS NULL;
