# ============================================================
# PARTE 1 — VIEW COM FUNÇÃO DE AGREGAÇÃO
# ============================================================

-- Primeiro calculamos a média das avaliações de cada livro.

SELECT "book_id", AVG("rating") AS "rating"
FROM "ratings"
GROUP BY "book_id";


-- Resultado:
╭─────────┬────────────────────╮
│ book_id │       rating       │
╞═════════╪════════════════════╡
│ 1       │ 3.7740194314501618 │
│ 2       │ 3.9714285714285715 │
│ 3       │ 3.0438596491228069 │
│ ...     │ ...                │
│ 78      │ 3.7558485438319438 │
╰─────────┴────────────────────╯


# ============================================================
# PARTE 2 — VIEW COM AVG + JOIN
# ============================================================

-- Criando uma VIEW com:
-- - ID do livro
-- - título
-- - ano
-- - média das avaliações

CREATE VIEW "average_book_ratings" AS

SELECT
    "book_id",
    "title",
    "year",
    AVG("rating") AS "rating"

FROM "ratings"

JOIN "books"
    ON "ratings"."book_id" = "books"."id"

GROUP BY "book_id";


-- Consultando a VIEW.

SELECT * FROM "average_book_ratings";


-- Resultado:
╭─────────┬──────────────────────────────┬──────┬────────╮
│ book_id │ title                        │ year │ rating │
╞═════════╪══════════════════════════════╪══════╪════════╡
│ 1       │ Boulder                      │ 2023 │ 3.77   │
│ 2       │ Whale                        │ 2023 │ 3.97   │
│ 3       │ The Gospel According...      │ 2023 │ 3.04   │
│ ...     │ ...                          │ ...  │ ...    │
│ 78      │ Flights                      │ 2018 │ 3.75   │
╰─────────┴──────────────────────────────┴──────┴────────╯


# ============================================================
# PARTE 3 — CONSULTANDO UMA VIEW
# ============================================================

-- Podemos utilizar uma VIEW em outra consulta.

SELECT
    "year",
    ROUND(AVG("rating"), 2) AS "rating"

FROM "average_book_ratings"

GROUP BY "year";


-- Resultado:
╭──────┬────────╮
│ year │ rating │
╞══════╪════════╡
│ 2018 │   3.75 │
│ 2019 │   3.64 │
│ 2020 │   3.79 │
│ 2021 │   3.69 │
│ 2022 │   3.87 │
│ 2023 │   3.79 │
╰──────┴────────╯


# ============================================================
# PARTE 4 — VIEW COMO SUBCONJUNTO
# ============================================================

-- Criando uma VIEW somente com os livros de 2022.

CREATE VIEW "2022" AS

SELECT "id", "title"
FROM "books"
WHERE "year" = 2022;


SELECT * FROM "2022";


-- Criando uma VIEW somente com os livros de 2021.

CREATE VIEW "2021" AS

SELECT "id", "title"
FROM "books"
WHERE "year" = 2021;


SELECT * FROM "2021";


-- Exemplo de resultado:
╭────┬──────────────────────────────╮
│ id │ title                        │
╞════╪══════════════════════════════╡
│ 14 │ Paradais                     │
│ 15 │ Heaven                       │
│ 16 │ Love in the Big City         │
│ 17 │ Happy Stories, Mostly        │
│ ...│ ...                          │
╰────┴──────────────────────────────╯