DELIMITER $$
DROP FUNCTION IF EXISTS ufn_count_employees_by_town;
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT													
DETERMINISTIC
BEGIN
		DECLARE e_count INT;
		SET e_count := ( SELECT COUNT(employee_id) AS count
						 FROM towns t
						 JOIN addresses a ON t.town_id = a.town_id
						 JOIN employees e ON a.address_id = e.address_id
                         WHERE t.name = town_name );
		RETURN e_count;
END$$

DELIMITER ;

SELECT ufn_count_employees_by_town('Sofia');
SELECT ufn_count_employees_by_town('Berlin');
SELECT ufn_count_employees_by_town(NULL);

SELECT * FROM soft_uni5.employees;
SELECT * FROM soft_uni4.towns;

SELECT salary
FROM employees
CASE 
	WHEN salary < 30000 THEN 'Low'
    WHEN salary BETWEEN 30000 AND 50000 THEN 'Average'
    WHEN salary > 50000 THEN 'High'
END

DELIMITER $$
DROP FUNCTION IF EXISTS ufn_get_salary_level;
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(10, 2))
RETURNS INT													
DETERMINISTIC
BEGIN
		DECLARE e_count DECIMAL(10, 2);
		SET e_count := ( SELECT e.salary FROM employees
						 CASE 
							 WHEN salary < 30000 THEN 'Low'
							 WHEN salary BETWEEN 30000 AND 50000 THEN 'Average'
							 WHEN salary > 50000 THEN 'High'
						 END );
		RETURN e_count;
END$$

DELIMITER ;

SELECT ufn_get_salary_level(13500);


DELIMITER $$
DROP PROCEDURE IF EXISTS usp_raise_salaries;
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN
	UPDATE employees e 
    JOIN departments d ON d.department_id = e.department_id
    SET salary = salary * 1.05
	WHERE d.name = department_name;
END $$

DELIMITER ;

CALL usp_raise_salaries('Sales');

SELECT employee_id, salary
FROM employees
WHERE department_id = 3;


DELIMITER $$
DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
	UPDATE employees e
    SET salary = salary * 1.05
	WHERE e.employee_id = id;
END $$

DELIMITER ;

SELECT salary FROM employees
WHERE employee_id = 37;

CALL usp_raise_salary_by_id(37);

















