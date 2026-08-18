-- SELECT * 
-- FROM sea_lions
-- JOIN migrations ON migrations.id = sea_lions.id;

-- Uso de aspas duplas: Usar somente quando o nome tiver espaços ou seja uma palavra reservada


-- Retorna todos os registros da tabela da esquerda (sea_lions),
-- Independentemente de haver dados associados na tabela da direita (migrations)

-- LEFT JOIN
-- SELECT * 
-- FROM sea_lions
-- LEFT JOIN migrations ON migrations.id = sea_lions.id;


-- É o oposto do LEFT JOIN: prioriza a tabela da direita

-- RIGHT JOIN
-- SELECT *
-- FROM sea_lions
-- RIGHT JOIN migrations ON migrations.id = sea_lions.id;


-- FULL JOIN ou (FULL OUTER JOIN)
-- Une as dous tabelas sem se importar com valores Nulos

-- SELECT * 
-- FROM sea_lions
-- FULL JOIN migrations ON migrations.id = sea_lions.id;


-- Não utiliza a cláusula ON
-- O banco de dados compara automaticamente todas as colunas que possuem o mesmo id em ambas as tabelas

-- NATURAL JOIN 
-- SELECT * 
-- FROM sea_lions
-- NATURAL JOIN migrations;
