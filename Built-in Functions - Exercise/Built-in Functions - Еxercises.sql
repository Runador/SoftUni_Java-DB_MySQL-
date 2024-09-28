SELECT * FROM soft_uni3.employees;

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%ei%';

SELECT first_name
FROM employees
WHERE department_id IN (3, 10)
AND hire_date BETWEEN '1995-00-00' AND '2005-00-00';

SELECT first_name, last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%';

SELECT first_name
FROM employees
WHERE CHAR_LENGTH(first_name) = 3;

SELECT name
FROM towns
WHERE char_length(name) IN (5, 6)
ORDER BY name;

SELECT * FROM towns;

SELECT town_id, name
FROM towns
WHERE name LIKE 'M%' OR 'K%' OR 'B%' OR 'E%'
ORDER BY name;

SELECT LOCATE('RED', 'Redmond', 1);

SELECT INSERT ('Str', 1, 3, 'Substring');