# ============================================================
# PARTE 1 — CONSULTA SEM INDEX ADEQUADO
# ============================================================

-- Consulta para encontrar os filmes estrelados por Tom Hanks.

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


# ============================================================
# PARTE 2 — EXPLAIN QUERY PLAN
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
--    |--SCAN stars
--    `--SCALAR SUBQUERY 1
--       `--SCAN people
--
--
-- Aqui aparecem operações de SCAN.
--
-- SCAN significa que o SQLite precisa percorrer registros
-- para encontrar aquilo que procura.


# ============================================================
# PARTE 3 — CRIANDO INDEXES
# ============================================================

-- Criando um índice para encontrar rapidamente a pessoa
-- através do person_id na tabela "stars".

CREATE INDEX "person_index"
ON "stars" ("person_id");


-- Criando um índice para procurar pessoas pelo nome.

CREATE INDEX "name_index"
ON "people" ("name");


# ============================================================
# PARTE 4 — EXPLAIN QUERY PLAN APÓS OS INDEXES
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
--    |--SEARCH stars USING INDEX person_index (person_id=?)
--    `--SCALAR SUBQUERY 1
--       `--SEARCH people USING COVERING INDEX name_index (name=?)
--
--
-- Agora o SQLite utiliza SEARCH através dos indexes,
-- em vez de simplesmente fazer SCAN nas tabelas.


# ============================================================
# PARTE 5 — TEMPO DE EXECUÇÃO
# ============================================================

-- Antes dos indexes:
--
-- Run Time: real 0.052
--
--
-- Depois dos indexes:
--
-- Run Time: real 0.001
--
--
-- O exemplo mostra como os indexes podem reduzir o trabalho
-- necessário para encontrar os dados.