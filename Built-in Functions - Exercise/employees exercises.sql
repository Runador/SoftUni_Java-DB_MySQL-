SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;

SELECT first_name
FROM employees
WHERE department_id IN (3, 10) AND
EXTRACT(YEAR FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

SELECT * FROM soft_uni3.employees;

SELECT first_name, last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

SELECT name
FROM towns
WHERE LENGTH(name) IN (5, 6)
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE LEFT(name, 1) IN('M','K','B','E')
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE NOT LEFT(name, 1) IN('R','B','D')
ORDER BY name;

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT first_name, last_name
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) > 2000
ORDER BY employee_id;
SELECT * FROM v_employees_hired_after_2000;

SELECT first_name, last_name
FROM employees
WHERE length(last_name) = 5;