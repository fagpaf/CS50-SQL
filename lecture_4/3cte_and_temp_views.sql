# ============================================================
# PARTE 1 — TEMPORARY VIEW
# ============================================================

-- Podemos criar uma VIEW temporária utilizando:
--
-- CREATE TEMPORARY VIEW
--
-- Ela existe temporariamente durante a sessão.


CREATE TEMPORARY VIEW "average_book_ratings_by_year" AS

SELECT
    "year",
    ROUND(AVG("rating"), 2) AS "rating"

FROM "average_book_ratings"

GROUP BY "year";


-- Consultando a VIEW temporária.

SELECT * FROM "average_book_ratings_by_year";


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
# PARTE 2 — CTE
# ============================================================

-- CTE = Common Table Expression.
--
-- É uma forma de criar uma tabela temporária que pode ser
-- referenciada dentro de uma consulta SQL.
--
-- A CTE é criada utilizando WITH.


WITH "average_book_ratings" AS (

    SELECT
        "book_id",
        "title",
        "year",
        ROUND(AVG("rating"), 2) AS "rating"

    FROM "ratings"

    JOIN "books"
        ON "ratings"."book_id" = "books"."id"

    GROUP BY "book_id"

)

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
│ 2023 │   3.78 │
╰──────┴────────╯