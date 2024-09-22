USE minions;

CREATE TABLE minions (
  id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  age INT
);

CREATE TABLE towns (
	town_id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)
);

ALTER TABLE towns
RENAME COLUMN town_id TO id;

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

INSERT INTO towns VALUES
(1, "Sofia"),
(2, "Plovdiv"),
(3, "Varna");

INSERT INTO minions VALUES
(1, "Kevin", 22, 1),
(2, "Bob", 15, 3),
(3, "Steward", NULL, 2);

TRUNCATE TABLE minions;

DROP TABLE minions, towns;

DROP DATABASE minions;

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