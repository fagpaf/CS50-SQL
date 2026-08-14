-- Consulta feita inicalmente com alguns erros de sintaxe
-- SELECT COUNT("season") AS 'last_six_years_ep'
-- FROM "episodes"
-- WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';

-- Consulta corrigida, com "*" para contar contar todas as linhas da tabela e aspas duplas para dar o nome da coluna 
SELECT COUNT(*) AS "last_six_years_ep"
FROM "episodes"
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';