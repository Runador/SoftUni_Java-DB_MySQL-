-- 1
CREATE DATABASE people;
USE people;
DROP DATABASE people;

CREATE TABLE people (
	person_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    salary DOUBLE(9,2),
    passport_id INT,
    
    CONSTRAINT fk_people_passports
    FOREIGN KEY (passport_id)
    REFERENCES passports (passport_id)
);

CREATE TABLE passports (
	passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(8)
);

INSERT INTO passports VALUES
	(101, 'N34FG21B'),
    (102, 'K65LO4R7'),
    (103, 'ZE657QP2');

INSERT INTO people (first_name, salary, passport_id) VALUES
	('Roberto', 43300.00, 102),
    ('Tom', 56100.00, 103),
    ('Yana', 60200.00, 101);
    
-- 2
CREATE DATABASE cars;
USE cars;

CREATE TABLE manufacturers (
	manufacturer_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    established_on DATE
);

CREATE TABLE models (
	model_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    manufacturer_id INT,
    
    CONSTRAINT fk_manufacturers_models
    FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers (manufacturer_id)
);

INSERT INTO manufacturers (name, established_on) VALUES 
	('BMW', '1916/03/01/'),
    ('Tesla', '2003/01/01'),
    ('Lada', '1966/05/01/');

INSERT INTO models VALUES 
	(101, 'X1', 1),
    (102, 'i6', 1),
    (103, 'Model S', 2),
    (104, 'Model X', 2),
    (105, 'Model 3', 2),
    (106, 'Nova', 3);
    
-- 3

-- 4

-- 5

-- 6

-- 7

-- 8
-- Направено.

-- 9
