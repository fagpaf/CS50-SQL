-- O modo que fiz no tentativa e erro
SELECT name, pupils
FROM districts
RIGHT JOIN expenditures ON expenditures.district_id = districts.id;

-- O jeito certo de fazer a consulta
SELECT name, pupils
FROM districts
JOIN expenditures 
    ON districts.id = expenditures.district_id;

-- Comece pela tabela districts e junte a tabela expenditures
-- Onde o id do distrito corresponde ao district_id de expenditures.