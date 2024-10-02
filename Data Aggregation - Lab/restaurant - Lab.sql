SELECT * FROM restaurant.employees;

SELECT department_id, COUNT(id) AS `Number of employees`
FROM employees
GROUP BY department_id
ORDER BY department_id, `Number of employees`;

SELECT department_id, ROUND(AVG(salary), 2) AS `Average salary`
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, ROUND(MIN(salary), 2) AS `Min Salary`
FROM employees
WHERE salary > 800
GROUP BY department_id
ORDER BY department_id
LIMIT 1;

SELECT COUNT(id)
FROM products
WHERE category_id = 2 AND price > 8
GROUP BY category_id;

SELECT * FROM restaurant.products;

SELECT category_id,
round(avg(price), 2) as `Average Price`,
round(min(price), 2) as `Cheapest Product`,
round(max(price), 2) as `Most Expensive Product`
FROM products
GROUP BY category_id;
