-- -- Modo que eu fiz e achei improdutivo
-- SELECT "title", "air_date", "season"
-- FROM "episodes"
-- WHERE "season" = 6 
--     AND ("air_date" BETWEEN '2007-01-01' AND '2007-12-31');


-- Melhor modo usando LIKE, como é uma string ele vai atrás de onde tem 2007
SELECT "title"
FROM "episodes"
WHERE "season" = 6 
    AND "air_date" LIKE '2007%';

