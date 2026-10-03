CREATE INDEX "title_index" ON "movies"("title");

SELECT * FROM "movies" WHERE "title" = 'Cars';

EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';
QUERY PLAN
`--SEARCH movies USING INDEX title_index (title=?)
Run Time: real 0.000 user 0.000000 sys 0.000093

SELECT "title" FROM "movies" WHERE "id" IN ( 
    SELECT "movie_id"
    FROM "stars"
    WHERE "person_id" = (
        SELECT "id" 
        FROM "people"
        WHERE "name" = 'Tom Hanks'
    )
);
Run Time: real 0.052 user 0.043135 sys 0.009028

QUERY PLAN
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SCAN stars
   `--SCALAR SUBQUERY 1
      `--SCAN people
Run Time: real 0.000 user 0.000096 sys 0.000000

CREATE INDEX "person_index" ON "stars" ("person_id");
CREATE INDEX "name_index" ON "people" ("name");

QUERY PLAN
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SEARCH stars USING INDEX person_index (person_id=?)
   `--SCALAR SUBQUERY 1
      `--SEARCH people USING COVERING INDEX name_index (name=?)
Run Time: real 0.001 user 0.000114 sys 0.000000


-- COVERING INDEX
-- É aquele em q os dados da consulta são encontrados pesquisando o INDEX

CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");
QUERY PLAN
|--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
`--LIST SUBQUERY 2
   |--SEARCH stars USING COVERING INDEX person_index (person_id=?)
   `--SCALAR SUBQUERY 1
      `--SEARCH people USING COVERING INDEX name_index (name=?)
Run Time: real 0.000 user 0.000076 sys 0.000025

-- Pesquisar as vantagens e desvantagens de usar INDEX (árvore-b)

-- Partial INDEX um indíce que inclui apenas um subconjunto de linhas de uma tabela

CREATE INDEX "recents" ON "movies" ("title")
WHERE "year" = 2023;

SELECT "title" FROM "movies" WHERE "year" = 2023;
QUERY PLAN
`--SCAN movies USING COVERING INDEX recents
Run Time: real 0.000 user 0.000000 sys 0.000077

-- VACUUM
-- Limpa a memória em disco dos arquivos "apagados" via DROP

-- CONCORRÊNCIA

-- ACID:
-- ATOMICIDADE
-- CONSISTÊNCIA
-- ISOLAMENTO
-- DURABILIDADE

BEGIN TRANSACTION;
--...
COMMIT;

SELECT * FROM "accounts";
┌────┬─────────┬─────────┐
│ id │  name   │ balance │
├────┼─────────┼─────────┤
│ 1  │ Alice   │ 10      │
│ 2  │ Bob     │ 20      │
│ 3  │ Charlie │ 30      │
└────┴─────────┴─────────┘


BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10 
WHERE "id" = 2;
COMMIT;

-- RAce conditions
-- tabela mutante

-- Locks