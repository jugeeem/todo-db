CREATE UNIQUE INDEX IF NOT EXISTS uniq_rl_user_roles_user_id_role_id_active
	ON rl.user_roles (user_id, role_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_rl_user_roles_user_id_active
	ON rl.user_roles (user_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_rl_user_roles_role_id_active
	ON rl.user_roles (role_id)
	WHERE deleted_at IS NULL;
