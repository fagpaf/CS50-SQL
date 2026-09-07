SELECT "first_name" AS "nome", "last_name" AS "sobrenome", "birth_state" AS "estado"
FROM "players"
WHERE "birth_country" = 'Brazil' 
ORDER BY "first_name" ASC, "last_name" ASC;