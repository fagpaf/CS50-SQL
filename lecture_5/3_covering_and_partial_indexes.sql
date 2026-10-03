# ============================================================
# PARTE 1 — COVERING INDEX
# ============================================================

-- COVERING INDEX
--
-- É aquele em que os dados necessários para a consulta
-- podem ser encontrados pesquisando o próprio INDEX.
--
-- Dessa forma, o SQLite não precisa necessariamente acessar
-- a tabela original para obter os dados necessários.


# ============================================================
# PARTE 2 — CRIANDO UM COVERING INDEX
# ============================================================

-- Aqui adicionamos "movie_id" ao índice.
--
-- O índice passa a conter:
--
-- person_id
-- movie_id

CREATE INDEX "person_index"
ON "stars" ("person_id", "movie_id");


# ============================================================
# PARTE 3 — EXPLAIN QUERY PLAN
# ============================================================

EXPLAIN QUERY PLAN

SELECT "title"
FROM "movies"
WHERE "id" IN (

    SELECT "movie_id"

    FROM "stars"

    WHERE "person_id" = (

        SELECT "id"

        FROM "people"

        WHERE "name" = 'Tom Hanks'

    )

);


-- Resultado:
--
-- |--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
-- `--LIST SUBQUERY 2
--    |--SEARCH stars USING COVERING INDEX person_index
--       (person_id=?)
--    `--SCALAR SUBQUERY 1
--       `--SEARCH people USING COVERING INDEX name_index
--          (name=?)
--
--
-- Agora aparece:
--
-- USING COVERING INDEX
--
-- indicando que o próprio índice contém os dados necessários
-- para aquela etapa da consulta.


# ============================================================
# PARTE 4 — VANTAGENS E DESVANTAGENS DOS INDEXES
# ============================================================

-- Os indexes utilizam uma estrutura de dados em árvore.
--
-- Sua anotação da aula indica:
--
-- "Pesquisar as vantagens e desvantagens de usar INDEX
--  (árvore-b)"
--
-- Esse é um ponto para revisar posteriormente.


# ============================================================
# PARTE 5 — PARTIAL INDEX
# ============================================================

-- Partial Index é um índice que inclui apenas um subconjunto
-- das linhas de uma tabela.
--
-- Neste exemplo, somente os filmes de 2023 fazem parte
-- do índice.


CREATE INDEX "recents"
ON "movies" ("title")

WHERE "year" = 2023;


# ============================================================
# PARTE 6 — CONSULTANDO O PARTIAL INDEX
# ============================================================

SELECT "title"
FROM "movies"
WHERE "year" = 2023;


# ============================================================
# PARTE 7 — EXPLAIN QUERY PLAN
# ============================================================

EXPLAIN QUERY PLAN

SELECT "title"
FROM "movies"
WHERE "year" = 2023;


-- Resultado:
--
-- `--SCAN movies USING COVERING INDEX recents
--
--
-- O SQLite utiliza o índice parcial "recents" para essa
-- consulta.