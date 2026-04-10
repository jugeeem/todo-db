-- TODO とタグの中間テーブル（多対多）
CREATE TABLE IF NOT EXISTS td.todo_tags (
	id	UUID	PRIMARY KEY	DEFAULT uuid_generate_v4(),

	todo_id	UUID	NOT NULL,
	tag_id	UUID	NOT NULL,

	created_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	created_by	UUID				NOT NULL,
	updated_at	TIMESTAMP WITH TIME ZONE	NOT NULL	DEFAULT NOW(),
	updated_by	UUID				NOT NULL,
	deleted_at	TIMESTAMP WITH TIME ZONE,
	deleted_by	UUID,

	FOREIGN KEY (todo_id) REFERENCES td.todos(id),
	FOREIGN KEY (tag_id) REFERENCES td.tags(id),

	UNIQUE (todo_id, tag_id)
);
