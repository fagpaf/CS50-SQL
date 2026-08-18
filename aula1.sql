-- SELECT "id"
-- FROM "publishers"
-- WHERE "publisher" = 'MacLehose Press';

-- SELECT "title"
-- FROM "books"
-- WHERE "publisher_id" = 12;

-- Com essa Subconsulta juntamos as duas acima em uma só, sem precisar ter conhecimento do "id" da editora
-- SELECT "title"
-- FROM "books"
-- WHERE "publisher_id" = (
--     SELECT "id" 
--     FROM "publishers"
--     WHERE "publisher" = 'MacLehose Press'
-- );

-- SELECT "id" 
-- FROM "books"
-- WHERE "title" = 'In Memory of Memory';

-- SELECT "rating"
-- FROM "ratings" 
-- WHERE "book_id" = 33;


-- SELECT "rating"
-- FROM "ratings" 
-- WHERE "book_id" = (
--     SELECT "id"
--     FROM "books"
--     WHERE "title" = 'In Memory of Memory'
-- );


-- SELECT ROUND(AVG("rating"), 2) AS "mean_rating"
-- FROM "ratings" 
-- WHERE "book_id" = (
--     SELECT "id"
--     FROM "books"
--     WHERE "title" = 'In Memory of Memory'
-- );

-- Todas as consultas acima são de 1-para-1
-- ============================================

-- SELECT "name"
-- FROM "authors"
-- WHERE "id" = (
--     SELECT "author_id"
--     FROM "authored"
--     WHERE "book_id" = (
--         SELECT "id"
--         FROM "books"
--         WHERE "title" = 'Flights'
--     )
-- );

-- Palavra chave "IN", aceita subconsultas que retornam 0, 1 ou N.
-- Sendo de cardinalidade 1-para-N


-- Para entender subconsultas aninhadas em SQL, a melhor forma é lê-las de dentro para fora

-- Consulta a tabela "books" e filtra apenas as linhas cujo "id" pertence à lista obtida no passo 2, exibindo a coluna "title"
-- SELECT "title"
-- FROM "books"
-- WHERE "id" IN (
--     SELECT "book_id"
    -- Vai até a tabela associativa de n-para-n "authored" e busca todos os "book_id" onde o author_id é o ID retornado no passo 1.
    -- FROM "authored"
    -- WHERE "author_id" = (
    --     SELECT "id"
    --     FROM "authors"
    --     WHERE "name" = 'Fernanda Melchor'
        -- Varre a tabela "authors" procurando pelo registro com o nome 'Fernanda Melchor' e devolve o seu "id"
-- );

-- Subconsultas n-para-n acima
-- ====================================================


-- JOIN

-- SELECT * 
-- FROM sea_lions
-- JOIN migrations ON migrations.id = sea_lions.id;

-- Uso de aspas duplas: Usar somente quando o nome tiver espaços ou seja uma palavra reservada

-- LEFT JOIN
SELECT * 
FROM sea_lions
LEFT JOIN migrations ON migrations.id = sea_lions.id;


-- RIGHT JOIN
SELECT *
FROM sea_lions
RIGHT JOIN migrations ON migrations.id = sea_lions.id;


-- FULL JOIN
SELECT * 
FROM sea_lions
FULL JOIN migrations ON migrations.id = sea_lions.id;


-- NATURAL JOIN 
SELECT * 
FROM sea_lions
NATURAL JOIN migrations;
