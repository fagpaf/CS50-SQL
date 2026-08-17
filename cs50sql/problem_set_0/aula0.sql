-- -- Aula 01 - CONSULTAS
-- -- Banco de dados: longlist.db
-- -- Objetivo: aprender a selecionar dados de uma tabela
-- -- =========================================================

-- -- Seleciona todas as colunas e todas as linhas da tabela "longlist"
-- -- O caractere '*' significa "todas as colunas"
-- -- Muito útil para explorar uma tabela pela primeira vez
-- SELECT * FROM "longlist";


-- -- Seleciona apenas a coluna "title"
-- -- Retorna somente o título de cada livro
-- SELECT "title" FROM "longlist";


-- -- Seleciona mais de uma coluna
-- -- Neste caso, exibe o título e o autor de cada livro
-- SELECT "title", "author" FROM "longlist";


-- -- LIMIT restringe a quantidade de linhas retornadas
-- -- Aqui serão exibidos apenas os 10 primeiros registros
-- SELECT "title" FROM "longlist" LIMIT 10;


-- -- WHERE filtra os registros de acordo com uma condição
-- -- Neste exemplo, mostra apenas os livros publicados em 2021
-- SELECT "title", "author"
-- FROM "longlist"
-- WHERE "year" = 2021;


-- -- Operador "!=" ou "<>" significa "diferente de"
-- -- Exibe os livros cujo formato NÃO é "hardcover"
-- SELECT "title", "format"
-- FROM "longlist"
-- WHERE "format" != 'hardcover';


-- -- NOT inverte a lógica da consulta 
-- SELECT "title", "format" 
-- FROM "longlist"
-- WHERE NOT "format" = "paperback";


-- -- Utilizando condicionais na consulta
-- SELECT "title", "format"
-- FROM "longlist"
-- WHERE ("year" = 2022 OR "year" = 2023)
-- AND "format" <> 'hardcover';


-- -- IS NULL usado para retornar o valores inexistentes
-- SELECT "title", "translator"
-- FROM "longlist"
-- WHERE "translator" IS NULL;


-- -- IS NOT NULL serve para ver as linhas não faltantes
-- SELECT "title", "translator"
-- FROM "longlist"
-- WHERE "translator" IS NOT NULL;

-- -- "LIKE" permite procurar padrões dentro de strings
-- -- "%" significa que qualquer sequência de caracteres pode aparecer
-- -- antes ou depois da string pesquisada
-- SELECT "title" FROM "longlist"
-- WHERE "title"
-- LIKE '%love%';

-- -- O "%" no final significa que a string deve aparecer no início
-- -- e pode ser seguida por qualquer sequência de caracteres
-- -- Neste caso, retorna títulos que começam com "the"
-- SELECT "title" FROM "longlist"
-- WHERE "title"
-- LIKE 'the%';

-- -- "" representa exatamente um caractere
-- -- Neste caso, "p_re" pode corresponder a "pure", "pare", etc.
-- -- O "" funciona como um espaço reservado para um único caractere
-- SELECT "title" FROM "longlist"
-- WHERE "title"
-- LIKE 'p_re';

-- -- BETWEEN seleciona valores dentro de um intervalo
-- -- Os valores inicial e final também são incluídos
-- -- Neste caso, retorna livros publicados entre 2020 e 2021
-- SELECT "title", "year" FROM "longlist"
-- WHERE "year" BETWEEN 2020 AND 2021;

-- -- AND exige que as duas condições sejam verdadeiras
-- -- Retorna livros com rating maior que 4.0
-- -- E que tenham mais de 1000 votos
-- SELECT "title", "rating", "votes" FROM "longlist"
-- WHERE "rating" > 4.0 AND "votes" > 1000;

-- -- O operador "<" retorna valores menores que o valor informado
-- -- Neste caso, retorna livros com menos de 300 páginas
-- SELECT "title", "pages" FROM "longlist"
-- WHERE "pages" < 300;

-- -- ORDER BY é usado para ordenar os resultados
-- -- DESC significa ordem decrescente
-- -- Neste caso, mostra os livros com maior rating primeiro
-- -- LIMIT 10 restringe o resultado aos 10 primeiros registros
-- SELECT "title", "rating" FROM "longlist"
-- ORDER BY "rating" DESC LIMIT 10;

-- -- É possível ordenar por mais de uma coluna
-- -- Primeiro, ordena pelo rating de forma decrescente
-- -- Em caso de empate no rating, usa "votes" como segundo critério
-- -- Também em ordem decrescente
-- -- LIMIT 10 retorna somente os 10 primeiros resultados
-- SELECT "title", "rating", "votes" FROM "longlist"
-- ORDER BY "rating" DESC, "votes" DESC
-- LIMIT 10;




-- SELECT AVG("rating") FROM "longlist";

-- SELECT ROUND(AVG("rating"), 2) FROM "longlist";

-- SELECT ROUND(AVG("rating"), 2) AS "rating mean" 
-- FROM "longlist";

-- SELECT MAX("rating") AS "rating max" 
-- FROM "longlist";

-- SELECT SUM("votes") AS "votes sum" 
-- FROM "longlist";


