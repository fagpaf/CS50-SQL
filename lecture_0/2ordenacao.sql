-- ============================================================
-- 1. BETWEEN — INTERVALOS
-- ============================================================

-- BETWEEN seleciona valores dentro de um intervalo.
-- O valor inicial E o valor final são incluídos.

-- Livros publicados entre 2020 e 2021:

SELECT "title", "year"
FROM "longlist"
WHERE "year" BETWEEN 2020 AND 2021;


-- O exemplo acima é equivalente a:

SELECT "title", "year"
FROM "longlist"
WHERE "year" >= 2020
AND "year" <= 2021;


-- ============================================================
-- 2. ORDER BY — ORDENAÇÃO
-- ============================================================

-- ORDER BY organiza os resultados.

-- ASC = ordem crescente.
-- ASC é o padrão quando nenhuma direção é especificada.

SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating" ASC;


-- DESC = ordem decrescente.

SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating" DESC;


-- Exemplo:
-- maior rating primeiro.

SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating" DESC
LIMIT 10;


-- ============================================================
-- 3. ORDER BY COM MAIS DE UMA COLUNA
-- ============================================================

-- Podemos ordenar por várias colunas.
--
-- Primeiro o SQL ordena por "rating".
-- Se houver empate, utiliza "votes" como segundo critério.

SELECT "title", "rating", "votes"
FROM "longlist"
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;


-- A lógica é:
--
-- 1º -> rating DESC
-- 2º -> votes DESC apenas em caso de empate
--
-- O segundo critério funciona como critério de desempate.