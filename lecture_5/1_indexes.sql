# ============================================================
# PARTE 1 — INDEX
# ============================================================

-- Um INDEX é utilizado para tornar determinadas consultas
-- mais eficientes.
--
-- Neste exemplo, criamos um índice para a coluna "title"
-- da tabela "movies".

CREATE INDEX "title_index"
ON "movies"("title");


# ============================================================
# PARTE 2 — CONSULTANDO COM O INDEX
# ============================================================

-- Consulta procurando um filme pelo título.

SELECT *
FROM "movies"
WHERE "title" = 'Cars';


# ============================================================
# PARTE 3 — EXPLAIN QUERY PLAN
# ============================================================

-- EXPLAIN QUERY PLAN permite observar como o SQLite pretende
-- executar uma consulta.

EXPLAIN QUERY PLAN

SELECT *
FROM "movies"
WHERE "title" = 'Cars';


-- Resultado:
--
-- `--SEARCH movies USING INDEX title_index (title=?)
--
-- Isso mostra que o SQLite está utilizando o índice
-- "title_index" para procurar o título.


# ============================================================
# PARTE 4 — TEMPO DE EXECUÇÃO
# ============================================================

-- Também podemos observar o tempo de execução da consulta.
--
-- Exemplo:
--
-- Run Time: real 0.000
-- user 0.000000
-- sys 0.000093
--
-- O tempo pode variar dependendo do computador e da consulta.