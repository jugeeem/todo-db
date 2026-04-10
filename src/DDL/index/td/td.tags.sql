CREATE INDEX IF NOT EXISTS idx_td_tags_user_id_active
	ON td.tags (user_id)
	WHERE deleted_at IS NULL;
