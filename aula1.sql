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

-- Todas as consultas acima são de 1---1
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
-- Sendo de cardinalidade 1----N

SELECT "title"
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "authored"
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);
