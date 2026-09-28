# ============================================================
# PARTE 1 — SUBQUERIES
# ============================================================

-- Encontrando o ID da autora.

SELECT "id"
FROM "authors"
WHERE "name" = 'Fernanda Melchor';


-- Encontrando os livros escritos pela autora.

SELECT "book_id"
FROM "authored"
WHERE "author_id" = (
    SELECT "id"
    FROM "authors"
    WHERE "name" = 'Fernanda Melchor'
);


-- Encontrando os títulos dos livros.

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


# ============================================================
# PARTE 2 — JOIN
# ============================================================

-- Podemos obter o mesmo resultado utilizando JOIN.
--
-- authors
--    ↓
-- authored
--    ↓
-- books

SELECT "name", "title"
FROM "authors"
JOIN "authored"
    ON "authors.id" = "authored.author_id"
JOIN "books"
    ON "books.id" = "authored.book_id";


# ============================================================
# PARTE 3 — O QUE É UMA VIEW?
# ============================================================

-- Uma VIEW é uma tabela virtual que contém o resultado
-- de uma consulta SQL.
--
-- Ela não armazena os dados fisicamente, mas sim a consulta
-- que gera os dados.
--
-- Views são úteis para:
-- - simplificar consultas complexas;
-- - criar uma camada de abstração;
-- - melhorar a segurança;
-- - disponibilizar apenas determinados dados.


# ============================================================
# PARTE 4 — CRIANDO UMA VIEW
# ============================================================

CREATE VIEW "longlist" AS

SELECT "name", "title"

FROM "authors"

JOIN "authored"
    ON "authors.id" = "authored.author_id"

JOIN "books"
    ON "books.id" = "authored.book_id";


-- Uma VIEW pode ser consultada como uma tabela.

SELECT * FROM "longlist";


# ============================================================
# PARTE 5 — FILTRANDO UMA VIEW
# ============================================================

-- Podemos utilizar WHERE normalmente sobre uma VIEW.

SELECT "title"
FROM "longlist"
WHERE "name" = 'Fernanda Melchor';


-- Resultado:
╭──────────────────╮
│      title       │
╞══════════════════╡
│ Paradais         │
│ Hurricane Season │
╰──────────────────╯