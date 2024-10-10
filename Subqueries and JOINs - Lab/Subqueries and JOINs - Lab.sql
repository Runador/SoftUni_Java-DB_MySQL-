SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) as full_name, e.department_id, d.name as department_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d 
ON  e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

SELECT e.employee_id, CONCAT(first_name, ' ',
last_name) AS 'full_name', d.department_id,
d.name
FROM employees AS e
RIGHT JOIN departments AS d
ON d.manager_id = e.employee_id
ORDER BY e.employee_id LIMIT 5;

SELECT a.town_id, t.name AS town_name, a.address_text
FROM addresses a
JOIN towns t ON a.town_id = t.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE manager_id IS NULL;

SELECT COUNT(*) AS count
FROM employees
WHERE salary > ( SELECT AVG(salary) FROM employees );







