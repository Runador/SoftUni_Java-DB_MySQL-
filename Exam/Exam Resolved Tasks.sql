SELECT * FROM summer_olympics.athletes;

INSERT INTO athletes(first_name, last_name, age, country_id)
SELECT UPPER(a.first_name), CONCAT(a.last_name, ' comes from ', c.name), a.age + c.id, a.country_id
FROM athletes a
JOIN countries c ON a.country_id = c.id
WHERE name LIKE 'A%';

UPDATE disciplines
SET name = REPLACE(name, 'weight', '')
WHERE name LIKE '%weight%';

DELETE FROM athletes
WHERE age > 35;

SELECT c.id, c.name
FROM countries c
LEFT JOIN athletes a ON a.country_id = c.id
WHERE a.country_id IS NULL
ORDER BY name DESC
LIMIT 15;

SELECT CONCAT_WS(' ', a.first_name, a.last_name) AS full_name, a.age
FROM athletes a
JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
JOIN medals m ON dam.medal_id = m.id
ORDER BY age
LIMIT 2;

DROP FUNCTION udf_total_medals_count_by_country;
DELIMITER $$
CREATE FUNCTION udf_total_medals_count_by_country (name VARCHAR(40))
RETURNS INT												
DETERMINISTIC
BEGIN
	DECLARE total_number_of_medals INT;
    
    SET total_number_of_medals := ( SELECT COUNT(*) AS count_of_medals
								   FROM countries c
								   JOIN athletes a ON c.id = a.country_id
								   JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
								   JOIN medals m ON dam.medal_id = m.id
								   WHERE c.name = name
								   GROUP BY c.name
								   LIMIT 1 );
    
    RETURN total_number_of_medals;
END $$

DELIMITER ;

SELECT udf_total_medals_count_by_country('Bahamas');



SELECT COUNT(*) AS count_of_medals
FROM countries c
JOIN athletes a ON c.id = a.country_id
JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
JOIN medals m ON dam.medal_id = m.id
WHERE c.name = 'Bahamas'
GROUP BY c.name
HAVING count_of_medals;


SELECT CONCAT_WS(' ', first_name, last_name) AS full_name,
CASE
	WHEN age <= 18 THEN 'Teenager'
    WHEN age BETWEEN 18 AND 25 THEN 'Young adult'
    ELSE 'Adult'
END AS age_group
FROM athletes
ORDER BY age DESC, first_name;


DROP PROCEDURE IF EXISTS udp_first_name_to_upper_case;
DELIMITER $$

CREATE PROCEDURE udp_first_name_to_upper_case(letter CHAR(1))
BEGIN
	UPDATE athletes SET first_name = UPPER(first_name)
    WHERE RIGHT(first_name, 1) = letter
    ORDER BY first_name;
END $$

DELIMITER ;

CALL udp_first_name_to_upper_case('s');

SELECT a.id, a.first_name, a.last_name
FROM athletes a
LEFT JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
LEFT JOIN medals m ON dam.medal_id = m.id
WHERE dam.athlete_id IS NULL;

SELECT a.id, a.first_name, a.last_name, COUNT(m.id) AS medals_count, d.name AS sport
FROM athletes a
LEFT JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
LEFT JOIN disciplines d ON d.sport_id = dam.discipline_id
LEFT JOIN medals m ON dam.medal_id = m.id
LEFT JOIN sports s ON s.id = d.sport_id
GROUP BY a.id, a.first_name, a.last_name, sport
ORDER BY medals_count DESC, a.first_name
LIMIT 10;

SELECT a.id, a.first_name, a.last_name, COUNT(m.medal_id) AS medals_count, s.name AS sport
FROM athletes a
JOIN disciplines_athletes_medals dam ON a.id = dam.athlete_id
JOIN disciplines d ON d.sport_id = dam.discipline_id
JOIN medals m ON a.id = m.athlete_id
JOIN sports s ON m.sport_id = s.id
GROUP BY a.id, a.first_name, a.last_name, s.name
ORDER BY medals_count DESC, a.first_name ASC
LIMIT 10;

SELECT EXTRACT(DAY FROM '2000-03-02');
SELECT DAY('2000-03-02');





