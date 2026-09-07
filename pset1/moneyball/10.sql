SELECT first_name, last_name, salary, performances.HR, salaries.year
FROM players
JOIN salaries
    ON players.id = salaries.player_id
JOIN performances
    ON players.id = performances.player_id
WHERE salaries.year = performances.year
ORDER BY players.id ASC,
         salaries.year DESC,
         performances.HR DESC,
         salary DESC;