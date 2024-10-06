-- 1
CREATE TABLE mountains (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    mountain_id INT,
    
    FOREIGN KEY (mountain_id)
    REFERENCES mountains (id)
);

-- 2
SELECT * FROM camp.campers;
SELECT * FROM camp.vehicles;

SELECT v.driver_id, v.vehicle_type, CONCAT_WS(' ', c.first_name, c.last_name) AS driver_name
FROM campers AS c
	JOIN vehicles AS v ON
    v.driver_id = c.id;

-- 3
SELECT r.starting_point as route_starting_point,
	   r.end_point as route_ending_point,
       r.leader_id,
       CONCAT_WS(' ', c.first_name, c.last_name) as leader_name
FROM routes r
JOIN campers AS c ON
	r.leader_id = c.id;

-- 4
CREATE TABLE mountains (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE peaks (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
	mountain_id INT,
    
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
	
    ON DELETE CASCADE
);

-- 5
-- Направено.