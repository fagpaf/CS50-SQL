# ============================================================
# PARTE 1 — MODIFICANDO UMA VIEW
# ============================================================

-- Tentando modificar diretamente uma VIEW.

UPDATE "2021"

SET "title" = ' The Minor Detail'

WHERE "title" = 'Minor Detail';


-- Resultado:
--
-- Parse error:
-- cannot modify 2021 because it is a view
--
-- A solução é atualizar a tabela base da VIEW.
-- Neste caso, a tabela "books".


# ============================================================
# PARTE 2 — VIEW PARA OCULTAR DADOS
# ============================================================

-- Podemos criar uma VIEW que não mostra determinadas
-- informações da tabela original.

SELECT * FROM "rides";


-- Selecionando somente algumas colunas.

SELECT
    "id",
    "origin",
    "destination"

FROM "rides";


-- Podemos substituir o valor real do rider por um
-- valor genérico.

SELECT
    "id",
    "origin",
    "destination",
    'Anonymous' AS "rider"

FROM "rides";


# ============================================================
# PARTE 3 — VIEW PARA OCULTAR O RIDER
# ============================================================

CREATE VIEW "analysis" AS

SELECT
    "id",
    "origin",
    "destination",
    'Anonymous' AS "rider"

FROM "rides";


SELECT * FROM "analysis";


-- Resultado:
╭────┬──────────────────┬──────────────────┬───────────╮
│ id │ origin           │ destination      │ rider     │
╞════╪══════════════════╪══════════════════╪═══════════╡
│ 1  │ Good Egg Galaxy  │ Honeyhive Galaxy │ Anonymous │
│ 2  │ Castle Courtyard │ Cascade Kingdom  │ Anonymous │
│ 3  │ Metro Kingdom    │ Mushroom Kingdom │ Anonymous │
│ 4  │ Seaside Kingdom  │ Deep Woods       │ Anonymous │
╰────┴──────────────────┴──────────────────┴───────────╯


# ============================================================
# PARTE 4 — SOFT DELETE
# ============================================================

-- Soft Delete significa marcar um registro como deletado
-- sem realmente removê-lo da tabela.
--
-- deleted = 0 → registro ativo
-- deleted = 1 → registro deletado


-- Adicionando a coluna.

ALTER TABLE "collections"

ADD COLUMN "deleted" INTEGER DEFAULT 0;


-- Marcando um registro como deletado.

UPDATE "collections"

SET "deleted" = 1

WHERE "title" = 'Farmers working at dawn';


-- Buscando somente os registros ativos.

SELECT *
FROM "collections"
WHERE "deleted" = 0;


# ============================================================
# PARTE 5 — VIEW DOS REGISTROS ATIVOS
# ============================================================

-- Criamos uma VIEW para esconder a lógica do Soft Delete.

CREATE VIEW "current_collections" AS

SELECT
    "id",
    "title",
    "accession_number",
    "acquired"

FROM "collections"

WHERE "deleted" = 0;


-- Agora basta consultar a VIEW.

SELECT * FROM "current_collections";


-- Resultado:
╭────┬───────────────────────┬──────────────────┬────────────╮
│ id │ title                 │ accession_number │ acquired   │
╞════╪═══════════════════════╪══════════════════╪════════════╡
│ 2  │ Imaginative landscape │ 56.496           │ NULL       │
│ 3  │ Profusion of flowers  │ 56.257           │ 1956-04-12 │
│ 4  │ Spring outing         │ 14.76            │ 1914-01-08 │
╰────┴───────────────────────┴──────────────────┴────────────╯