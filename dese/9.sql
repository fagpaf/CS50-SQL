-- Esse foi o modo q eu consegui 
-- SELECT name, pupils
-- FROM districts
-- JOIN expenditures ON districts.id = expenditures.district_id
-- ORDER BY pupils ASC;
----------------------------------------------------------------
-- WHERE MIN(pupils);
-- MIN() não é uma condição que você coloca diretamente no WHERE
-- Ele é uma Função de Agregação

-- O jeito certo, retornando a(s) escola(s) com menor número
SELECT name
FROM districts
JOIN expenditures
    ON districts.id = expenditures.district_id
WHERE pupils = (
    SELECT MIN(pupils)
    FROM expenditures
);