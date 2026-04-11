CREATE DATABASE kratos_db
	WITH
	ENCODING = 'UTF8'
	LC_COLLATE = 'ja_JP.UTF-8'
	LC_CTYPE = 'ja_JP.UTF-8'
	TEMPLATE = template0;

ALTER DATABASE kratos_db SET timezone TO 'Asia/Tokyo';
