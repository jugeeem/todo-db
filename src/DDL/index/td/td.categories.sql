CREATE INDEX IF NOT EXISTS idx_td_categories_user_id_active
	ON td.categories (user_id)
	WHERE deleted_at IS NULL;
