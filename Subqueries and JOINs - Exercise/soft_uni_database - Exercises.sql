-- 1
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees e
INNER JOIN addresses a ON e.address_id = a.address_id
ORDER BY address_id
LIMIT 5;

-- 2
SELECT e.first_name, e.last_name, t.name as town, a.address_text
FROM employees e
JOIN addresses a ON e.address_id = a.address_id
JOIN towns t ON t.town_id = a.town_id
ORDER BY first_name, last_name
LIMIT 5;

-- 3
SELECT e. employee_id, e.first_name, e.last_name, d.name as department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY employee_id DESC;

-- 4
SELECT e. employee_id, e.first_name, e.salary, d.name as department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

-- 5
SELECT e. employee_id, e.first_name
FROM employees e
LEFT JOIN employees_projects ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

-- 6
SELECT e.first_name, e.last_name, e.hire_date, d.name as dept_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date > '1999-01-01' AND d.name IN ('Sales', 'Finance')
ORDER BY e.hire_date;

-- 7
SELECT e. employee_id, e.first_name, p.name as project_name
FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON p.project_id = ep.project_id
WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name, project_name
LIMIT 5;

-- 8
SELECT e.employee_id, e.first_name, 
IF(YEAR(p.start_date) >= 2005, NULL, p.name) as project_name
FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON p.project_id = ep.project_id
WHERE e.employee_id = 24
ORDER BY project_name;

-- 9
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name as manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IN (3, 7)
ORDER BY e.first_name;

-- 10
SELECT e.employee_id, CONCAT_WS(' ', e.first_name, e.last_name) as employee_name,
CONCAT_WS(' ', m.first_name, m.last_name) as manager_name, d.name as department_name
FROM employees e
JOIN employees m 
ON e.manager_id = m.employee_id
JOIN departments d 
ON e.department_id = d.department_id
ORDER BY employee_id
LIMIT 5;

-- 11
SELECT ( SELECT AVG(salary) FROM employees
		 WHERE department_id = e.department_id ) as min_average_salary
FROM employees e
ORDER BY min_average_salary
LIMIT 1;





