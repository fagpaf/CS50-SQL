SELECT name, per_pupil_expenditure
FROM schools
JOIN expenditures
    ON schools.district_id = expenditures.district_id
ORDER BY per_pupil_expenditure ASC, name ASC
LIMIT 10;
