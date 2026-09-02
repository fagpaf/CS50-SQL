SELECT name, district_id
FROM schools
WHERE district_id = (
    SELECT id
    FROM districts
    WHERE name = 'Cambridge'
);
