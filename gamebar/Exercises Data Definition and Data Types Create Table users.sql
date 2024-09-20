CREATE DATABASE minions;

USE minions;

CREATE TABLE people (
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture TEXT,
    height DOUBLE(10,2),
    weight DOUBLE(10,2),
	gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT
);

INSERT INTO minions.people VALUES (
	(1, "Sergey", "pic", 183.2, 72.00, 'm', '1992-03-02', "some text ............"),
    (2, "Jenja", "pic", 173.2, 122.00, 'm', '1990-03-27', "some text ............"),
    (3, "Seva", "pic", 173.2, 62.00, 'm', '1995-03-27', "some text ............"),
    (4, "Olga", "pic", 163.2, 80.00, 'f', '1959-05-25', "some text ............"),
    (5, "Sasha", "pic", 163.2, 80.00, 'f', '1987-05-12', "some text ............")
);
    
CREATE TABLE users (
	id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
	password VARCHAR(26) NOT NULL,
    profile_picture TEXT,
    last_login_time TIME,
    is_deleted BOOLEAN
);

INSERT INTO users VALUES
(1, "Runador", "pass12345", "pic1", "12:33:22", false),
(2, "Olga", "1234", "pic2", "10:34:25", false),
(3, "Jenya", "pass345", "pic3", "13:32:21", false),
(4, "Seva", "pass1245", "pic4", "12:31:32", true),
(5, "Sasha", "pass123", "pic5", "13:33:42", false);

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY(id, username);

ALTER TABLE users
CHANGE COLUMN last_login_time last_login_time TIME DEFAULT NOW();

ALTER TABLE users
MODIFY COLUMN last_login_time TIME DEFAULT NOW();

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY(id);

ALTER TABLE users
MODIFY username VARCHAR(30) NOT NULL UNIQUE;







