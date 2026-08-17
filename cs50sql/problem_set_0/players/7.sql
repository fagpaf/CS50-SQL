SELECT COUNT(*) AS "qtd_ambi"
FROM "players"
WHERE "bats" = 'R' AND "throws" = 'L' 
    OR "bats" = 'L' AND "throws" = 'R';