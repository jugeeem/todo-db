CREATE INDEX IF NOT EXISTS idx_td_todo_tags_todo_id_active
	ON td.todo_tags (todo_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todo_tags_tag_id_active
	ON td.todo_tags (tag_id)
	WHERE deleted_at IS NULL;
