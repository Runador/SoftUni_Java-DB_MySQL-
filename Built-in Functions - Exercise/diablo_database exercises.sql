SELECT * FROM diablo.games;

SELECT name, DATE_FORMAT(start, '%Y-%m-%d') AS `start`
FROM games
WHERE
EXTRACT(YEAR from start) BETWEEN 2011 AND 2012
ORDER BY start, name
LIMIT 50;

SELECT user_name,
SUBSTRING(email, LOCATE('@', email) + 1) AS `email provider`
FROM users
ORDER BY `email provider`, user_name;

SELECT * FROM diablo.users;

SELECT user_name, ip_address
FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

SELECT * FROM games;

SELECT name AS `game`,
CASE 
	WHEN HOUR(start) < 12 THEN 'Morning'
	WHEN HOUR(start) < 18 THEN 'Afternoon'
    WHEN HOUR(start) < 24 THEN 'Evening'
END as `Part of the Day`,
CASE
	WHEN duration <= 3 THEN 'Extra Short'
    WHEN duration between 3 AND 6 THEN 'Short'
    WHEN duration between 6 AND 10 THEN 'Long'
    ELSE 'Extra Long'
END as `Duration`
FROM games;




