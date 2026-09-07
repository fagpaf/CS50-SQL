SELECT city, COUNT(*) AS total_schools
FROM schools
WHERE type = 'Public School'
GROUP BY city
ORDER BY total_schools DESC, city ASC
LIMIT 10;
