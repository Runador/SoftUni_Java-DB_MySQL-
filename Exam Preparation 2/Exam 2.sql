CREATE DATABASE go_roadie;
USE go_roadie;
DROP DATABASE go_roadie;

CREATE TABLE cities (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE cars (
	id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE instructors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL UNIQUE,
    has_a_license_from DATE NOT NULL
);

CREATE TABLE driving_schools (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    night_time_driving BOOLEAN NOT NULL,
    average_lesson_price DECIMAL(10, 2),
    car_id INT NOT NULL,
    city_id INT NOT NULL,
    
    FOREIGN KEY (car_id) 
    REFERENCES cars(id),
    FOREIGN KEY (city_id) 
    REFERENCES cities(id)
);

CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL UNIQUE,
    age INT,
    phone_number VARCHAR(20) UNIQUE
);

CREATE TABLE instructors_driving_schools (
	instructor_id INT,
    driving_school_id INT NOT NULL,
    
    PRIMARY KEY (instructor_id, driving_school_id),
    
    FOREIGN KEY (instructor_id) REFERENCES instructors (id),
    FOREIGN KEY (driving_school_id) REFERENCES driving_schools (id)
);

CREATE TABLE instructors_students (
	instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    
    PRIMARY KEY (instructor_id, student_id),
    
    FOREIGN KEY (instructor_id) REFERENCES instructors (id),
    FOREIGN KEY (student_id) REFERENCES students (id)
);

INSERT INTO cities (id, name)
VALUES (1, 'Dundee'),
       (2, 'Glasgow'),
       (3, 'Aberdeen'),
       (4, 'Leeds'),
       (5, 'London'),
       (6, 'Nottingham'),
       (7, 'Liverpool'),
       (8, 'Manchester'),
       (9, 'Birmingham'),
       (10, 'Bradford'),
       (11, 'Peterhead'),
       (12, 'Gosport'),
       (13, 'Canterbury'),
       (14, 'Kirkcaldy'),
       (15, 'Worcester');

INSERT INTO cars (brand, model)
VALUES ('Toyota', 'Camry'),
       ('Honda', 'Civic'),
       ('Ford', 'Focus'),
       ('Chevrolet', 'Malibu'),
       ('Nissan', 'Altima'),
       ('BMW', '3 Series'),
       ('Audi', 'A4'),
       ('Mercedes-Benz', 'C-Class'),
       ('Volkswagen', 'Jetta'),
       ('Hyundai', 'Sonata'),
       ('Kia', 'Optima'),
       ('Subaru', 'Impreza'),
       ('Mazda', 'Mazda3'),
       ('Lexus', 'ES'),
       ('Acura', 'TLX'),
       ('Infiniti', 'Q50'),
       ('Cadillac', 'ATS'),
       ('Buick', 'Regal'),
       ('GMC', 'Terrain'),
       ('Jeep', 'Cherokee'),
       ('Chrysler', '300'),
       ('Dodge', 'Charger'),
       ('Dodge', 'Ram'),
       ('Ford', 'Mustang'),
       ('Chevrolet', 'Camaro'),
       ('Toyota', 'Corolla'),
       ('Honda', 'Accord'),
       ('Subaru', 'Outback'),
       ('Nissan', 'Rogue'),
       ('Hyundai', 'Elantra');

INSERT INTO instructors (first_name, last_name, has_a_license_from)
VALUES ('John', 'Doe', '1980-01-01'),
       ('Jane', 'Smith', '1981-05-01'),
       ('Michael', 'Johnson', '1990-11-01'),
       ('Emily', 'Brown', '2000-10-01'),
       ('William', 'Jones', '1980-02-01'),
       ('Jessica', 'Davis', '2001-03-01'),
       ('Daniel', 'Miller', '1986-01-23'),
       ('Sarah', 'Wilson', '1995-01-14'),
       ('David', 'Taylor', '2005-01-15'),
       ('Laura', 'Anderson', '2011-01-14'),
       ('Matthew', 'Thomas', '2000-01-24'),
       ('Jennifer', 'Jackson', '2020-01-22'),
       ('Christopher', 'White', '1998-01-17'),
       ('Ashley', 'Harris', '2003-01-18'),
       ('Jessica', 'Martin', '2004-01-30'),
       ('Robert', 'Thompson', '2002-04-01'),
       ('Amanda', 'Garcia', '2005-05-01'),
       ('James', 'Martinez', '2013-06-01'),
       ('Brittany', 'Robinson', '2014-07-01'),
       ('Andrew', 'Clark', '2016-07-01'),
       ('Melissa', 'Lewis', '2006-08-01'),
       ('Justin', 'Lee', '2001-01-01'),
       ('Stephanie', 'Walker', '1999-01-22'),
       ('Jonathan', 'Perez', '2002-01-14'),
       ('Nicole', 'Hall', '2000-01-13'),
       ('Brandon', 'Young', '2007-01-26'),
       ('Heather', 'Allen', '2022-01-25'),
       ('Eric', 'Sanchez', '2015-01-25'),
       ('Samantha', 'Wright', '2017-11-01'),
       ('Kyle', 'King', '2018-11-01'),
       ('Elizabeth', 'Scott', '2019-10-01'),
       ('Tyler', 'Green', '1996-11-01'),
       ('Alex', 'Leen', '1998-12-01'),
       ('Nahtim', 'Djaravan', '1986-11-01'),
       ('Naim', 'Suleiman', '1997-12-01'),
       ('Hasan', 'Hasan', '1999-04-08'),
       ('Mohamed', 'Grinbati', '1999-05-09'),
       ('Mustafa', 'Mehmed', '1993-03-03'),
       ('Rojer', 'Tacher', '1994-06-01'),
       ('Paul', 'Hogan', '1991-09-06'),
       ('Rebecca', 'Baker', '1982-06-01');

INSERT INTO driving_schools (name, night_time_driving, average_lesson_price, car_id, city_id)
VALUES ('AJK Driving School', 1, 69.99, 23, 15),
       ('AK Drive', 1, 69.99, 30, 6),
       ('ALAM Driving School', 1, 69.99, 12, 5),
       ('AM Driving School', 0, 69.00, 13, 15),
       ('APOLLO Driving School', 1, 69.99, 16, 4),
       ('AQ4PASS', 0, 56.99, 2, 4),
       ('AS driving school', 1, 45.99, 4, 3),
       ('ASK School', 1, 55.99, 2, 3),
       ('ASM DRIVER TRAINING', 1, 87.99, 5, 3),
       ('AZIRATI driving school', 0, 78.99, 6, 12),
       ('Aapass Driving School', 1, 76.99, 7, 11),
       ('Able2Drive SOM Notts', 1, 66.99, 8, 13),
       ('Agnew Driving School', 0, 88.99, 9, 14),
       ('Ahmed Driving School', 0, 30.99, 19, 5),
       ('Ailsa''s Driving Instruction', 1, 54.99, 22, 1),
       ('Alan Henderson-Driving', 1, 53.99, 21, 14),
       ('Alan Stevens Driving', 1, 67.45, 25, 12),
       ('Alan Street Smart Driving School', 1, 69.00, 27, 12),
       ('Alba Driving Training', 1, 70.99, 28, 3),
       ('Albys School', 1, 60.99, 29, 2),
       ('Alisons Driving School', 0, 60.00, 30, 2),
       ('Alpha Automatic Driving tuition', 1, 68.00, 14, 4),
       ('Come Drive', 1, 82.00, 23, 7),
       ('Confident Pass Driving School', 1, 83.00, 16, 7),
       ('Coolrunnings', 1, 89.00, 1, 7),
       ('Drive AND Pass', 1, 86.00, 2, 1),
       ('Drive Automatic', 1, 110.00, 5, 7),
       ('Drive Wright Scotland', 1, 100.00, 6, 3),
       ('Drive2Pass Driving School', 1, 49.00, 26, 2),
       ('Drive4lifeacademy', 1, 56.00, 22, 2),
       ('EV L Drive', 1, 80.00, 3, 1),
       ('Empire Driving School', 1, 78.00, 9, 15),
       ('Evieonepasses', 1, 60.00, 8, 14),
       ('Fiona McMeekin Driving School', 1, 80.00, 5, 7),
       ('Ford Driving School', 1, 90.00, 4, 12),
       ('Freedom Drive', 1, 65.00, 7, 7),
       ('Full Circle Driving School', 1, 66.00, 9, 11),
       ('GGO Driving School', 1, 55.00, 7, 7),
       ('GILL''s Driving Academy', 1, 59.00, 6, 13),
       ('Got2Drive', 1, 70.00, 16, 7),
       ('Gus Caledonian LDT', 1, 90.00, 15, 7),
       ('Tomcat Driving', 1, 98.00, 18, 7),
       ('Hotwheelz School', 1, 89.00, 21, 5),
       ('Horgis Automatic Driving', 1, 30.00, 20, 4),
       ('I-Drive', 1, 33.00, 11, 2),
       ('Igo Driving School', 1, 44.00, 13, 3),
       ('JFK DRIVING', 1, 27.00, 10, 7),
       ('Jewel Control Driving School', 1, 54.00, 10, 6),
       ('Jigsaw SOM', 1, 26.00, 1, 10),
       ('K P DRIVING', 1, 43.00, 25, 11),
       ('KAR-n-DRIVE', 1, 34.00, 18, 4),
       ('JustDrive Driving School', 1, 29.00, 24, 5),
       ('Top Drive', 0, 80.00, 23, 7),
       ('LEAP Driving Training', 1, 65.00, 27, 8),
       ('King Driver Training', 1, 37.00, 6, 9),
       ('LambertвЂ™s Learners', 1, 56.50, 7, 1),
       ('Learn2drive', 0, 80.60, 8, 4),
       ('Mentords', 1, 35.00, 1, 13),
       ('OK 4U', 1, 36.00, 18, 7),
       ('OK-2-GO-DRIVING', 1, 43.00, 2, 7),
       ('One Driving Solution', 1, 35.00, 9, 12),
       ('Pass it! Driving Academy', 1, 39.00, 11, 5),
       ('Practical Driving school', 0, 65.00, 10, 7),
       ('Progressive Driver Training', 1, 23.00, 9, 7),
       ('Roadsense', 1, 45.00, 8, 7),
       ('Roadstar Driving School', 0, 54.00, 8, 4),
       ('Shawpass Driving', 1, 46.00, 18, 7),
       ('Skyline driving school', 0, 47.00, 12, 7),
       ('iQ Driving School', 1, 28.00, 1, 1);


INSERT INTO students (first_name, last_name, age, phone_number)
VALUES ('Peter', 'Schultz', 20, '123-456-7890'),
       ('Jakomo', 'Indarasi', 22, '987-654-3210'),
       ('Michael', 'Pinch', 19, '323-123-4567'),
       ('Emily', 'Lynch', 21, '212-838-1546'),
       ('David', 'Williams', 23, '198-312-6666'),
       ('William', 'Taylor', 20, '111-222-3333'),
       ('James', 'Anderson', 22, '666-777-3245'),
       ('Jessica', 'Schlemiel', 21, '333-444-5555'),
       ('Robert', 'Fernandez', 19, '888-999-2765'),
       ('Jennifer', 'Garcia', 24, '262-333-4444'),
       ('Christopher', 'Lopez', 20, '121-325-6500'),
       ('Mary', 'Young', 23, '100-389-7777'),
       ('Matthew', 'Brown', 21, '329-111-2222'),
       ('Amanda', 'Lee', 22, '717-838-4554'),
       ('Daniel', 'Walker', 20, '333-444-2312'),
       ('Ashley', 'Hill', 19, '828-999-2342'),
       ('Andrew', 'Scott', 21, '323-333-4444'),
       ('Emily', 'Green', 24, '765-143-1221'),
       ('David', 'Sahan', 33, '145-656-7654'),
       ('Sarah', 'Bakers', 22, '987-121-5436'),
       ('Ryan', 'Nelson', 21, '787-878-5674'),
       ('Jessica', 'White', 19, '710-444-1112'),
       ('Michael', 'Carter', 23, '234-999-1265'),
       ('Nelson', 'Evans', 38, '222-333-4444'),
       ('John', 'Perez', 22, '959-909-1145'),
       ('Jennifer', 'Mitchell', 21, '963-666-7898'),
       ('Kevin', 'Roberts', 40, '147-111-2222'),
       ('Michelle', 'Turner', 24, '983-888-1211'),
       ('Matthew', 'Phillips', 20, '333-444-4545'),
       ('Emily', 'Mandela', 23, '866-919-1122'),
       ('David', 'Parker', 21, '564-313-3900'),
       ('Jim', 'Allen', 22, '543-786-1111'),
       ('Christopher', 'Stewart', 44, '112-666-5465'),
       ('Ashley', 'Morrison', 34, '356-102-1432'),
       ('Michael', 'Cook', 24, '809-888-1587'),
       ('Jennifer', 'Bailey', 21, '333-444-963'),
       ('Sarah', 'Cooper', 23, '201-999-2435'),
       ('Matthew', 'Sanchez', 20, '222-333-3478'),
       ('Jessica', 'Morris', 22, '109-000-1234'),
       ('David', 'Rogers', 46, '678-606-1209'),
       ('Andrew', 'Peterson', 24, '101-111-2909'),
       ('Michelle', 'Foster', 29, '985-808-1993'),
       ('Laura', 'Long', 21, '301-444-1981'),
       ('John', 'Harrison', 23, '120-999-4512'),
       ('Jennifer', 'James', 20, '212-321-4094'),
       ('Matthew', 'Bennett', 22, '203-020-1111'),
       ('Jessica', 'Reed', 39, '031-666-2176');

INSERT INTO instructors_driving_schools
VALUES (1, 2),
       (2, 1),
       (3, 11),
       (4, 69),
       (5, 10),
       (6, 46),
       (7, 54),
       (8, 14),
       (9, 35),
       (10, 63),
       (11, 4),
       (12, 41),
       (13, 55),
       (14, 67),
       (15, 9),
       (16, 1),
       (17, 18),
       (18, 41),
       (19, 10),
       (20, 31),
       (21, 51),
       (22, 27),
       (23, 16),
       (24, 32),
       (25, 45),
       (26, 10),
       (27, 10),
       (28, 10),
       (29, 12),
       (30, 11),
       (31, 28),
       (32, 53),
       (33, 56),
       (34, 57),
       (35, 68),
       (36, 47),
       (37, 30),
       (38, 7),
       (39, 2),
       (40, 3),
       (41, 6);

INSERT INTO instructors_students (instructor_id, student_id)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5),
    (6,6),
    (7,7),
    (8,8),
    (9,9),
    (10,10),
    (11,11),
    (12,12),
    (13,13),
    (14,14),
    (15,15),
    (16,16),
    (17,17),
    (18,18),
    (19,19),
    (20,20),
    (21,21),
    (22,22),
    (23,23),
    (24,24),
    (25,25),
    (26,26),
    (27,27),
    (28,28),
    (29,29),
    (30,30),
    (31,31),
    (32,32),
    (33,33),
    (34,34),
    (35,35),
    (36,36),
    (37,37),
    (38,38),
    (39,39),
    (40,40),
    (41,41),
    (1,42),
    (13,43),
    (30,44),
    (16,45),
    (21,46),
    (40,47);

SELECT * FROM go_roadie.students;
INSERT INTO students (first_name, last_name, age, phone_number)
SELECT
	 REVERSE(LOWER(first_name)), 
     REVERSE(LOWER(last_name)), 
     age + LEFT(phone_number, 1),
     CONCAT('1+', phone_number)
FROM students
WHERE age < 20;

SELECT * FROM go_roadie.driving_schools;
UPDATE driving_schools
SET average_lesson_price = average_lesson_price + 30
WHERE city_id = 5 AND night_time_driving = 1;

DELETE FROM driving_schools
WHERE night_time_driving = 0;


SELECT * FROM go_roadie.students;

SELECT CONCAT_WS(' ', first_name, last_name) AS full_name, age
FROM students
WHERE first_name LIKE '%a%'
ORDER BY age
LIMIT 3;

SELECT ds.id, ds.name, c.brand
FROM driving_schools ds
JOIN cars c ON c.id = ds.car_id
LEFT JOIN instructors_driving_schools ids ON ids.driving_school_id = ds.id
WHERE ids.instructor_id IS NULL
ORDER BY brand, ds.id
LIMIT 5;

SELECT i.first_name, i.last_name, COUNT(iis.instructor_id) AS students_count, c.name AS city
FROM instructors i
JOIN instructors_students iis ON iis.instructor_id = i.id
JOIN students s ON s.id = iis.student_id
JOIN instructors_driving_schools ids ON i.id = ids.instructor_id
JOIN driving_schools ds ON ds.id = ids.driving_school_id
JOIN cities c ON c.id = ds.city_id

GROUP BY iis.instructor_id, c.name
ORDER BY students_count DESC, i.first_name
LIMIT 6;

SELECT c.name, 
	( SELECT COUNT(i.id) ) AS instructors_count
FROM cities c
JOIN driving_schools ds ON c.id = ds.city_id
JOIN instructors_driving_schools ids ON ds.id = ids.driving_school_id
JOIN instructors i ON i.id = ids.instructor_id
GROUP BY c.name
ORDER BY instructors_count DESC;

SELECT * FROM go_roadie.driving_schools;
SELECT * FROM go_roadie.cars;
SELECT * FROM go_roadie.instructors_driving_schools;
SELECT * FROM go_roadie.instructors;
SELECT * FROM go_roadie.instructors_students;
SELECT * FROM go_roadie.students;
SELECT * FROM go_roadie.cities;

SELECT CONCAT_WS(' ', i.first_name, i.last_name) AS full_name, 
CASE
	WHEN YEAR(has_a_license_from) >= 1980 AND YEAR(has_a_license_from) < 1990 THEN 'Specialist'
    WHEN YEAR(has_a_license_from) >= 1990 AND YEAR(has_a_license_from) < 2000 THEN 'Advanced'
    WHEN YEAR(has_a_license_from) >= 2000 AND YEAR(has_a_license_from) < 2008 THEN 'Experienced'
    WHEN YEAR(has_a_license_from) >= 2008 AND YEAR(has_a_license_from) < 2015 THEN 'Qualified'
    WHEN YEAR(has_a_license_from) >= 2015 AND YEAR(has_a_license_from) < 2020 THEN 'Provisional'
    WHEN YEAR(has_a_license_from) >= 2020 THEN 'Trainee'
END AS level
FROM instructors i
ORDER BY YEAR(has_a_license_from), i.first_name;







