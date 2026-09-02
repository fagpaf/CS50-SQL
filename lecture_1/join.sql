-- JOIN combina registros de duas tabelas usando uma condição.
--
-- Estrutura:
--
-- SELECT ...
-- FROM tabela_A
-- JOIN tabela_B
--     ON tabela_A.coluna = tabela_B.coluna;


-- INNER JOIN
-- JOIN sem especificar o tipo = INNER JOIN.
-- Retorna apenas registros que possuem correspondência
-- nas duas tabelas.

SELECT *
FROM sea_lions
JOIN migrations
    ON sea_lions.id = migrations.id;


-- LEFT JOIN
-- Mantém TODOS os registros da tabela à esquerda (FROM).
-- Se não houver correspondência na direita, retorna NULL.

SELECT *
FROM sea_lions
LEFT JOIN migrations
    ON sea_lions.id = migrations.id;


-- RIGHT JOIN
-- Mantém TODOS os registros da tabela à direita.
-- Se não houver correspondência na esquerda, retorna NULL.

SELECT *
FROM sea_lions
RIGHT JOIN migrations
    ON sea_lions.id = migrations.id;


-- FULL JOIN
-- Mantém TODOS os registros das duas tabelas.
-- Registros sem correspondência recebem NULL.

SELECT *
FROM sea_lions
FULL JOIN migrations
    ON sea_lions.id = migrations.id;


-- NATURAL JOIN
-- Não utiliza ON.
-- O banco relaciona automaticamente colunas que possuem
-- o mesmo nome nas duas tabelas.

SELECT *
FROM sea_lions
NATURAL JOIN migrations;


-- ============================================================
-- COMO PENSAR NO JOIN
-- ============================================================

-- FROM = tabela inicial
-- JOIN = tabela que quero adicionar
-- ON = como as tabelas se relacionam


-- INNER JOIN:
-- "Quero apenas o que existe nas duas."


-- LEFT JOIN:
-- "Quero tudo da tabela do FROM."


-- RIGHT JOIN:
-- "Quero tudo da tabela depois do JOIN."


-- FULL JOIN:
-- "Quero tudo das duas."


-- Em INNER JOIN, a ordem das tabelas pode ser invertida:
--
-- FROM A JOIN B
-- é equivalente a
-- FROM B JOIN A
--
-- desde que o ON seja ajustado.


-- Com LEFT/RIGHT JOIN, a ordem importa.


-- ============================================================
-- EXEMPLO — DESE
-- ============================================================

SELECT name, pupils
FROM districts
JOIN expenditures
    ON districts.id = expenditures.district_id;


-- districts.id é a chave que se relaciona com
-- expenditures.district_id.