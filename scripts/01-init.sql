
CREATE DATABASE task_db;

\c task_db

CREATE TABLE Role (
    id     integer NOT NULL PRIMARY KEY,
    name    varchar(255) NOT NULL,
	description varchar(255)
);
CREATE TABLE Project (
	id integer NOT NULL PRIMARY KEY,
	name    varchar(255) NOT NULL,
	description varchar(255)
);
CREATE TABLE Project_role (
	id integer NOT NULL PRIMARY KEY,
	role_id integer NOT NULL,
	project_id integer NOT NULL,
	name varchar(255) NOT NULL,
	foreign key(role_id) references Role(id),
	foreign key(project_id) references Project(id)
);
CREATE TABLE Users (
	id integer NOT NULL PRIMARY KEY,
	project_role_id integer NOT NULL,
	user_name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	foreign key(project_role_id) references Project_role(id)
);
CREATE TABLE Task (
	id integer NOT NULL PRIMARY KEY,
	user_id integer NOT NULL,
	project_id integer NOT NULL,
	name varchar(255) NOT NULL,
	description varchar(255),
	status varchar(255),
	init_date date,
	due_date date,
	priority varchar(255),
	category varchar(255),
	foreign key(user_id) references Users(id),
	foreign key(project_id) references Project(id)
);
CREATE TABLE Comment (
	id integer NOT NULL PRIMARY KEY,
	user_id integer NOT NULL,
	task_id integer NOT NULL,
	content varchar(255),
	foreign key(user_id) references Users(id),
	foreign key(task_id) references Task(id)
);