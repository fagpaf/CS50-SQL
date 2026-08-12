-- Aula 01 - CONSULTAS
-- Banco de dados: longlist.db
-- Objetivo: aprender a selecionar dados de uma tabela
-- =========================================================

-- Seleciona todas as colunas e todas as linhas da tabela "longlist"
-- O caractere '*' significa "todas as colunas"
-- Muito útil para explorar uma tabela pela primeira vez
-- SELECT * FROM "longlist";


-- Seleciona apenas a coluna "title"
-- Retorna somente o título de cada livro
-- SELECT "title" FROM "longlist";


-- Seleciona mais de uma coluna
-- Neste caso, exibe o título e o autor de cada livro
-- SELECT "title", "author" FROM "longlist";


-- LIMIT restringe a quantidade de linhas retornadas
-- Aqui serão exibidos apenas os 10 primeiros registros
-- SELECT "title" FROM "longlist" LIMIT 10;


-- WHERE filtra os registros de acordo com uma condição
-- Neste exemplo, mostra apenas os livros publicados em 2021
-- SELECT "title", "author"
-- FROM "longlist"
-- WHERE "year" = 2021;


-- Operador "!=" ou "<>" significa "diferente de"
-- Exibe os livros cujo formato NÃO é "hardcover"
-- SELECT "title", "format"
-- FROM "longlist"
-- WHERE "format" != 'hardcover';


-- NOT inverte a lógica da consulta 
-- SELECT "title", "format" 
-- FROM "longlist"
-- WHERE NOT "format" = "paperback";


-- Utilizando condicionais na consulta
-- SELECT "title", "format"
-- FROM "longlist"
-- WHERE ("year" = 2022 OR "year" = 2023)
-- AND "format" <> 'hardcover';


-- IS NULL usado para retornar o valores inexistentes
-- SELECT "title", "translator"
-- FROM "longlist"
-- WHERE "translator" IS NULL;


-- IS NOT NULL serve para ver as linhas não faltantes
-- SELECT "title", "translator"
-- FROM "longlist"
-- WHERE "translator" IS NOT NULL;

