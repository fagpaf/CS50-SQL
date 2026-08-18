-- Desse modo, temos a média da coluna inteira e não por id de cada livro
-- SELECT AVG( rating) 
-- FROM ratings;


-- HAVING serve para condicões em grupos no lugar do WHERE, que é para condicões individuais
-- SELECT book_id, ROUND(AVG(rating), 2) AS avg_rating
-- FROM ratings
-- GROUP BY book_id
-- HAVING avg_rating > 4.0;


-- SELECT book_id, COUNT(rating)
-- FROM ratings
-- GROUP BY book_id;


-- GROUP BY e ORDER BY
-- A diferença básica é que GROUP BY condensa e agrupa linhas para fazer cálculos,
-- Enquanto ORDER BY apenas organiza e ordena a exibição dos resultados.
-- SELECT book_id, ROUND(AVG(rating), 2) AS avg_rating
-- FROM ratings
-- GROUP BY book_id
-- HAVING avg_rating > 4.0
-- ORDER BY avg_rating DESC;