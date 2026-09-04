-- O WHERE não é global. Ele pertence ao SELECT em que está.

-- SEM JOIN
SELECT salary
FROM salaries
WHERE player_id = (
    SELECT player_id
    FROM performances
    WHERE year = 2001
      AND HR = (
          SELECT MAX(HR)
          FROM performances
          WHERE year = 2001
      )
)
AND year = 2001;

--------------------------------------------------
SELECT salaries.salary
FROM salaries
JOIN performances
    ON salaries.player_id = performances.player_id
WHERE performances.year = 2001
  AND performances.HR = (
      SELECT MAX(HR)
      FROM performances
      WHERE year = 2001
  )
  AND salaries.year = 2001;