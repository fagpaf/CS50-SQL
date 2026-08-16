-- Forma original que fiz, que conta duplicatas
-- SELECT COUNT("title" IS NOT NULL) AS "unique_title"
-- FROM "episodes";

-- Usando DISTINCT eu garanto a unicidade do título, dando uma diferenca de 4
SELECT COUNT(DISTINCT "title") AS "unique_title"
FROM "episodes";