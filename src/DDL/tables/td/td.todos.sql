CREATE TABLE IF NOT EXISTS td.todos (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	title		VARCHAR(256)			NOT NULL,
	description	TEXT,
	status		VARCHAR(50)			NOT NULL,	-- 'pending', 'in_progress', 'done', 'cancelled'
	priority	SMALLINT			NOT NULL	DEFAULT 2,	-- 1: 高, 2: 中, 3: 低
	due_date	TIMESTAMP WITH TIME ZONE,
	completed_at	TIMESTAMP WITH TIME ZONE,

	user_id		UUID				NOT NULL,
	category_id	UUID,
	parent_todo_id	UUID,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (user_id) REFERENCES usr.users(id),
	FOREIGN KEY (category_id) REFERENCES td.categories(id),
	FOREIGN KEY (parent_todo_id) REFERENCES td.todos(id)
);
