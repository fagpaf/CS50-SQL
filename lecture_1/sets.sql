-- SELECT name
-- FROM translators;

-- SELECT name
-- FROM authors;

-- UNION para ver autores e tradutores na mesma tabela
-- SELECT name
-- FROM translators
-- UNION 
-- SELECT name 
-- FROM authors;

-- Aqui com esta consulta conseguimos ver quem é autor e tradutor, com uma nova coluna de profissão
-- SELECT 'author' AS profession, name
-- FROM authors
-- UNION
-- SELECT 'translator' AS profession, name
-- FROM translators;

-- Com INTERSECT, temos a intersecão entre quem é autor e tradutor ao mesmo tempo
-- SELECT name
-- FROM authors
-- INTERSECT
-- SELECT name
-- FROM translators;

-- EXCEPT faz com que não consultemos aqueles que estão na Intersecão dos conjuntos
-- SELECT name
-- FROM authors
-- EXCEPT
-- SELECT name 
-- FROM translators;

-- Nessa consulta vemos o id do livro em que 'Sophie Hughes' e 'Margaret Jull Costa' colaboraram
-- SELECT book_id
-- FROM translated
-- WHERE translator_id = (
--     SELECT id
--     FROM translators
--     WHERE name = 'Sophie Hughes'
-- )
-- INTERSECT
-- SELECT book_id
-- FROM translated
-- WHERE translator_id = (
--     SELECT id 
--     FROM translators
--     WHERE name = 'Margaret Jull Costa'
-- );