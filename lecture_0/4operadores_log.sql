-- ============================================================
-- 1. AND, OR E NOT — OPERADORES LÓGICOS
-- ============================================================

-- AND:
-- TODAS as condições precisam ser verdadeiras.

-- Rating maior que 4.0 E mais de 1000 votos:

SELECT "title", "rating", "votes"
FROM "longlist"
WHERE "rating" > 4.0
AND "votes" > 1000;


-- OR:
-- Pelo menos UMA das condições precisa ser verdadeira.

SELECT "title", "year"
FROM "longlist"
WHERE "year" = 2022
OR "year" = 2023;


-- Podemos combinar AND e OR.
-- Parênteses ajudam a deixar a lógica explícita.

SELECT "title", "format"
FROM "longlist"
WHERE ("year" = 2022 OR "year" = 2023)
AND "format" <> 'hardcover';


-- NOT:
-- Inverte uma condição.

SELECT "title", "format"
FROM "longlist"
WHERE NOT "format" = 'paperback';


-- O exemplo acima pode ser escrito de forma equivalente como:

SELECT "title", "format"
FROM "longlist"
WHERE "format" != 'paperback';


-- ============================================================
-- 2. NULL — VALORES AUSENTES
-- ============================================================

-- NULL representa ausência de valor.
--
-- IMPORTANTE:
-- Não usamos:
--
-- WHERE "translator" = NULL
--
-- Para verificar NULL usamos IS NULL.


-- Livros que NÃO possuem tradutor:

SELECT "title", "translator"
FROM "longlist"
WHERE "translator" IS NULL;


-- Livros que possuem tradutor:

SELECT "title", "translator"
FROM "longlist"
WHERE "translator" IS NOT NULL;