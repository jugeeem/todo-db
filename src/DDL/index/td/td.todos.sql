ALTER TABLE td.todos DROP CONSTRAINT IF EXISTS chk_td_todos_status;
ALTER TABLE td.todos ADD CONSTRAINT chk_td_todos_status
	CHECK (status IN ('pending', 'in_progress', 'done', 'cancelled'));

ALTER TABLE td.todos DROP CONSTRAINT IF EXISTS chk_td_todos_priority;
ALTER TABLE td.todos ADD CONSTRAINT chk_td_todos_priority
	CHECK (priority BETWEEN 1 AND 3);

CREATE INDEX IF NOT EXISTS idx_td_todos_user_id_active
	ON td.todos (user_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todos_status_active
	ON td.todos (status)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todos_category_id_active
	ON td.todos (category_id)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todos_due_date_active
	ON td.todos (due_date)
	WHERE deleted_at IS NULL AND due_date IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_td_todos_priority_active
	ON td.todos (priority)
	WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_td_todos_parent_todo_id_active
	ON td.todos (parent_todo_id)
	WHERE deleted_at IS NULL AND parent_todo_id IS NOT NULL;
