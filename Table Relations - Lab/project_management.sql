CREATE TABLE clients (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    client_name VARCHAR(100)
);

CREATE TABLE projects (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    client_id INT(11),
    project_lead_id INT(11),
    
    FOREIGN KEY (client_id)
    REFERENCES clients (id)
);

CREATE TABLE employees (
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT(11),
    
    FOREIGN KEY (project_id)
    REFERENCES projects (id)
);

ALTER TABLE projects
ADD FOREIGN KEY (project_lead_id)
REFERENCES employees(id);