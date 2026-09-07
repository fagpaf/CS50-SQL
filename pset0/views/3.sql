SELECT COUNT(*) AS "qtd_fuji"
FROM "views"
WHERE "artist" = 'Hokusai'
AND "english_title" LIKE '%fuji%';
