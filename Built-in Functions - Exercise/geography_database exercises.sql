SELECT * FROM geography.countries;

SELECT country_name, iso_code
FROM countries
WHERE country_name LIKE '%A%A%A%'
ORDER BY iso_code;

SELECT * FROM peaks, rivers;
SELECT * FROM rivers;

SELECT peak_name, river_name, LOWER(concat_ws('', peak_name, MID(river_name, 2))) AS `mix`
FROM peaks, rivers
WHERE RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY mix;
