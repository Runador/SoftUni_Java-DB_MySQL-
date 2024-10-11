-- 12
SELECT c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON mc.mountain_id = m.id
JOIN peaks p ON m.id = p.mountain_id
WHERE c.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;

-- 13
SELECT mc.country_code, COUNT(m.mountain_range) AS mountain_range
FROM mountains m
JOIN mountains_countries mc ON m.id = mc.mountain_id
WHERE mc.country_code IN ('US', 'RU', 'BG')
GROUP BY mc.country_code
HAVING COUNT(m.mountain_range)
ORDER BY mountain_range DESC;

-- 14
SELECT c.country_name, r.river_name
FROM countries c
LEFT JOIN countries_rivers cr ON c.country_code = cr.country_code
LEFT JOIN continents co ON c.continent_code = co.continent_code
LEFT JOIN rivers r ON cr.river_id = r.id
WHERE co.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;

-- 15
SELECT c.continent_code, c.currency_code, COUNT(*) AS currency_usage
FROM countries c
GROUP BY c.continent_code, c.currency_code
HAVING currency_usage = ( SELECT COUNT(*) AS currency_usage
						  FROM countries
						  WHERE continent_code = c.continent_code
						  GROUP BY currency_code
						  ORDER BY currency_usage DESC
						  LIMIT 1 ) AND currency_usage > 1
ORDER BY c.continent_code, c.currency_code;

-- 16
SELECT COUNT(c.country_code) AS country_count
FROM countries c
LEFT JOIN mountains_countries mc ON c.country_code = mc.country_code
WHERE mc.country_code IS NULL;

-- 17
SELECT c.country_name,
    MAX(p.elevation) AS highest_peak_elevation,
    MAX(r.length) AS longest_river_length
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON m.id = mc.mountain_id
LEFT JOIN peaks p ON p.mountain_id = m.id
JOIN countries_rivers cr ON cr.country_code = c.country_code
LEFT JOIN rivers r ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name ASC
LIMIT 5;

















