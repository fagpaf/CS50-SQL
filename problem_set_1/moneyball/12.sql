SELECT first_name, last_name
FROM players
WHERE id IN (
    -- Top 10 menos caros por Hit (H) em 2001
    SELECT players.id
    FROM players
    JOIN performances
        ON players.id = performances.player_id
    JOIN salaries
        ON players.id = salaries.player_id
    WHERE salaries.year = 2001
        AND performances.year = 2001
        AND H > 0
    ORDER BY (salary/performances.H) ASC
    LIMIT 10
)
AND id IN (
    -- Top 10 menos caros por RBI em 2001
    SELECT players.id
    FROM players
    JOIN performances
        ON players.id = performances.player_id
    JOIN salaries
        ON players.id = salaries.player_id
    WHERE salaries.year = 2001
        AND performances.year = 2001
        AND RBI > 0
    ORDER BY (salary/performances.RBI) ASC
    LIMIT 10
)
ORDER BY id ASC;
