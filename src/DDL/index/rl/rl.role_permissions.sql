CREATE UNIQUE INDEX IF NOT EXISTS uniq_rl_role_permissions_role_id_permission_id_active
	ON rl.role_permissions (role_id, permission_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_rl_role_permissions_role_id_active
	ON rl.role_permissions (role_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_rl_role_permissions_permission_id_active
	ON rl.role_permissions (permission_id)
	WHERE deleted_at IS NULL;
