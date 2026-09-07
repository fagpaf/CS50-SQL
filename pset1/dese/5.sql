SELECT city, COUNT(*) AS total_schools
FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING total_schools <= 3
ORDER BY total_schools DESC, city ASC;
