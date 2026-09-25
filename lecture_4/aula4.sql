SELECT "id" 
FROM "authors"
WHERE "name" = 'Fernanda Melchor';

SELECT "book_id"
FROM "authored" 
WHERE "author_id" = (
    SELECT "id"
    FROM "authors"
    WHERE "name" = 'Fernanda Melchor'
);

SELECT "title"
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "authored" 
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);
-----------------------------------------

SELECT "name", "title"
FROM "authors"
JOIN "authored" ON "authors.id" = "authored.author_id"
JOIN "books" ON "books.id" = "authored.book_id";


-- Uma VIEW é uma tabela virtual que contém o resultado de uma consulta SQL. 
-- Ela não armazena dados fisicamente, mas sim a consulta que gera os dados. 
-- As views são úteis para simplificar consultas complexas, fornecer uma camada de abstração e melhorar a segurança, permitindo que os usuários acessem apenas os dados relevantes.
CREATE VIEW "longlist" AS
SELECT "name", "title"
FROM "authors"
JOIN "authored" ON "authors.id" = "authored.author_id"
JOIN "books" ON "books.id" = "authored.book_id";

SELECT * FROM longlist;
+-------------------------+--------------------------------------------+
|          name           |                   title                    |
+-------------------------+--------------------------------------------+
| Eva Baltasar            | Boulder                                    |
| Cheon Myeong-Kwan       | Whale                                      |
| Maryse Condé            | The Gospel According to the New World      |
| .....                   | ..............                             |
| Olga Tokarczuk          | Flights                                    |
+-------------------------+--------------------------------------------+

SELECT "title"
FROM "longlist"
WHERE "name" = 'Fernanda Melchor';
╭──────────────────╮
│      title       │
╞══════════════════╡
│ Paradais         │
│ Hurricane Season │
╰──────────────────╯

SELECT "book_id", AVG("rating") AS "rating" 
FROM "ratings"
GROUP BY "book_id";
╭─────────┬────────────────────╮
│ book_id │       rating       │
╞═════════╪════════════════════╡
│       1 │ 3.7740194314501618 │
│       2 │ 3.9714285714285715 │
│       3 │ 3.0438596491228069 │
│     ... │ ........           │
│      78 │ 3.7558485438319438 │
╰─────────┴────────────────────╯

CREATE VIEW "average_book_ratings" AS
SELECT "book_id", "title", "year", AVG("rating") AS "rating"
FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

SELECT * FROM "average_book_ratings";
╭─────────┬────────────────────────────────────────────┬──────┬────────────────────╮
│ book_id │                   title                    │ year │       rating       │
╞═════════╪════════════════════════════════════════════╪══════╪════════════════════╡
│       1 │ Boulder                                    │ 2023 │ 3.7740194314501618 │
│       2 │ Whale                                      │ 2023 │ 3.9714285714285715 │
│       3 │ The Gospel According to the New World      │ 2023 │ 3.0438596491228069 │
|     ... │ ............                               │ .... │ .................. │
│      78 │ Flights                                    │ 2018 │ 3.7558485438319438 │
╰─────────┴────────────────────────────────────────────┴──────┴────────────────────╯

SELECT "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";
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

-- Criando uma VIEW temporária a partir de uma VIEW já criada
CREATE TEMPORARY VIEW "average_book_ratings_by_year" AS
SELECT "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";

SELECT * FROM "average_book_ratings_by_year";
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

------------------------------
-- CTE (Common Table Expression) é uma forma de criar uma tabela temporária que pode ser referenciada dentro de uma consulta SQL.

WITH "average_book_ratings" AS (
    SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating"
    FROM "ratings"
    JOIN "books" ON "ratings"."book_id" = "books"."id"
    GROUP BY "book_id"
)
SELECT "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";
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

CREATE VIEW "2022" AS
SELECT "id", "title"
FROM "books"
WHERE "year" = 2022;

SELECT * FROM "2022";
╭────┬──────────────────────────────╮
│ id │            title             │
╞════╪══════════════════════════════╡
│ 14 │ Paradais                     │
│ 15 │ Heaven                       │
│ 16 │ Love in the Big City         │
│ 17 │ Happy Stories, Mostly        │
│ 18 │ Elena Knows                  │
│ 19 │ The Book of Mother           │
│ 20 │ More Than I Love My Life     │
│ 21 │ Phenotypes                   │
│ 22 │ A New Name: Septology VI-VII │
│ 23 │ After the Sun                │
│ 24 │ Tomb of Sand                 │
│ 25 │ The Books of Jacob           │
│ 26 │ Cursed Bunny                 │
╰────┴──────────────────────────────╯

CREATE VIEW "2021" AS
SELECT "id", "title"
FROM "books"
WHERE "year" = 2021;

SELECT * FROM "2021";
╭────┬───────────────────────────────────────╮
│ id │                 title                 │
╞════╪═══════════════════════════════════════╡
│ 27 │ The War of the Poor                   │
│ 28 │ When We Cease to Understand the World │
│ 29 │ Wretchedness                          │
│ 30 │ An Inventory of Losses                │
│ 31 │ At Night All Blood is Black           │
│ 32 │ I Live in the Slums                   │
│ 33 │ In Memory of Memory                   │
│ 34 │ Minor Detail                          │
│ 35 │ Summer Brother                        │
│ 36 │ The Dangers of Smoking in Bed         │
│ 37 │ The Employees                         │
│ 38 │ The Pear Field                        │
│ 39 │ The Perfect Nine                      │
╰────┴───────────────────────────────────────╯

UPDATE "2021" SET "title" = ' The Minor Detail'
WHERE "title" = 'Minor Detail';
-- Parse error near line 22: cannot modify 2021 because it is a view
-- O que devemos fazer é atualizar a tabela adjecente, ou seja, a tabela "books" que é a tabela base da view "2021".
