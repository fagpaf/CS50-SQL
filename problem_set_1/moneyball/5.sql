-- Modo que eu fiz com Subconsulta
SELECT name
FROM teams
WHERE id IN (
    SELECT team_id
    FROM performances
    WHERE player_id = (
        SELECT id
        FROM players
        WHERE first_name = 'Satchel'
          AND last_name = 'Paige'
    )
);

-- Com JOIN, mais otimizado
-- O DISTINCT garante que o nome do time não se repita
SELECT DISTINCT name
FROM teams
JOIN performances 
    ON teams.id = performances.team_id
JOIN players 
    ON performances.player_id = players.id
WHERE first_name = 'Satchel'
    AND last_name = 'Paige';