-- ============================================================
-- FUNÇÕES DE AGREGAÇÃO
-- ============================================================

-- Funções de agregação calculam um valor a partir de várias linhas.
--
-- MIN()   -> menor valor
-- MAX()   -> maior valor
-- AVG()   -> média
-- SUM()   -> soma
-- COUNT() -> quantidade


-- ------------------------------------------------------------
-- AVG() — MÉDIA
-- ------------------------------------------------------------

SELECT AVG("rating")
FROM "longlist";


-- ROUND() arredonda um número.
-- O segundo argumento indica quantas casas decimais.

SELECT ROUND(AVG("rating"), 2)
FROM "longlist";


-- ------------------------------------------------------------
-- AS — ALIAS
-- ------------------------------------------------------------

-- AS permite dar um nome ao resultado de uma coluna/expressão.

SELECT ROUND(AVG("rating"), 2) AS "rating mean"
FROM "longlist";


-- ------------------------------------------------------------
-- MAX() — MAIOR VALOR
-- ------------------------------------------------------------

SELECT MAX("rating") AS "rating max"
FROM "longlist";


-- ------------------------------------------------------------
-- MIN() — MENOR VALOR
-- ------------------------------------------------------------

SELECT MIN("rating") AS "rating min"
FROM "longlist";


-- ------------------------------------------------------------
-- SUM() — SOMA
-- ------------------------------------------------------------

SELECT SUM("votes") AS "votes sum"
FROM "longlist";


-- ------------------------------------------------------------
-- COUNT() — CONTAGEM
-- ------------------------------------------------------------

-- COUNT() conta registros/valores de acordo com a expressão usada.


-- ============================================================
-- 11. MIN() / MAX() — CUIDADO COM O WHERE
-- ============================================================

-- MIN() retorna o menor valor encontrado.

SELECT MIN("rating")
FROM "longlist";


-- Porém, isto NÃO funciona como filtro:
--
-- WHERE MIN("rating")
--
-- Motivo:
-- WHERE filtra LINHAS.
-- MIN() é uma função de agregação que calcula um VALOR
-- considerando várias linhas.


-- Para encontrar as linhas que possuem o menor valor,
-- podemos usar uma subquery.

-- Exemplo:
--
-- Primeiro encontramos o menor número de alunos:
--
-- SELECT MIN("pupils")
-- FROM "expenditures"
--
-- Depois usamos esse valor para filtrar:
--
-- WHERE "pupils" = (...)


SELECT "name", "pupils"
FROM "districts"
JOIN "expenditures"
    ON "districts"."id" = "expenditures"."district_id"
WHERE "pupils" = (
    SELECT MIN("pupils")
    FROM "expenditures"
);


-- IMPORTANTE:
-- Essa abordagem retorna TODOS os registros que possuem
-- o menor valor.
--
-- Isso é diferente de:
--
-- ORDER BY "pupils" ASC
-- LIMIT 1
--
-- porque LIMIT 1 retorna apenas UMA linha, mesmo que existam
-- vários registros empatados.