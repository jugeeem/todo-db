CREATE INDEX IF NOT EXISTS idx_td_todo_comments_todo_id_active
	ON td.todo_comments (todo_id, created_at)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todo_comments_user_id_active
	ON td.todo_comments (user_id)
	WHERE deleted_at IS NULL;
