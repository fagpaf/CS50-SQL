SELECT COUNT(*) AS "qtd_Eastern_Capital"
FROM "views"
WHERE "artist" = 'Hiroshige'
AND "english_title" LIKE '%Eastern Capital%';
