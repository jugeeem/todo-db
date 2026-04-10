CREATE INDEX IF NOT EXISTS idx_pr_permissions_name_active
	ON pr.permissions (name)
	WHERE deleted_at IS NULL;
