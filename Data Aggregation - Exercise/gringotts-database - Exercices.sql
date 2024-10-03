SELECT * FROM gringotts.wizzard_deposits;

SELECT COUNT(id) AS `count`
FROM wizzard_deposits;

SELECT MAX(magic_wand_size) AS `longest_magic_wand`
FROM wizzard_deposits;

SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand`, deposit_group;

SELECT deposit_group
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size)
LIMIT 1;

SELECT deposit_group, SUM(deposit_amount) as `total_sum`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY `total_sum`;

SELECT deposit_group, SUM(deposit_amount) as `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

SELECT deposit_group, SUM(deposit_amount) as `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

SELECT deposit_group, SUM(deposit_amount) as `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group DESC;

SELECT deposit_group, magic_wand_creator, min(deposit_charge) as `min_deposit_charge`
FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;

SELECT 
CASE
	WHEN age <= 10 THEN '[0-10]'
	WHEN age <= 20 THEN '[11-20]'
	WHEN age <= 30 THEN '[21-30]'
	WHEN age <= 40 THEN '[31-40]'
	WHEN age <= 50 THEN '[41-50]'
	WHEN age <= 60 THEN '[51-60]'
	WHEN age >= 61 THEN '[61+]'
END as age_group, COUNT(id) as `wizard_count`
FROM wizzard_deposits
GROUP BY age_group
ORDER BY age_group;

SELECT * FROM gringotts.wizzard_deposits;

SELECT LEFT(first_name, 1) as `first_letter`
FROM wizzard_deposits
GROUP BY first_letter, deposit_group
HAVING deposit_group = 'Troll Chest'
ORDER BY first_letter;

SELECT deposit_group, is_deposit_expired, avg(deposit_interest) `average_interest`
FROM wizzard_deposits
GROUP BY deposit_group, average_interest
ORDER BY deposit_group DESC;



