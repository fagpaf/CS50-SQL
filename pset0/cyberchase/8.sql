SELECT COUNT(*) AS 'first_six_years_ep'
FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
