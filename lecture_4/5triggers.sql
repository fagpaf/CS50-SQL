# ============================================================
# PARTE 1 — PROBLEMA: DELETE EM UMA VIEW
# ============================================================

-- Tentando deletar diretamente da VIEW.

DELETE FROM "current_collections"

WHERE "title" = 'Imaginative landscape';


-- Resultado:
--
-- Parse error:
-- cannot modify current_collections because it is a view
--
-- Para permitir essa operação, podemos utilizar um TRIGGER.


# ============================================================
# PARTE 2 — TRIGGER
# ============================================================

-- Um TRIGGER permite executar comandos automaticamente
-- quando determinada operação acontece.
--
-- INSTEAD OF DELETE significa:
--
-- "Em vez de executar o DELETE normalmente, execute
-- o que estiver dentro do TRIGGER."


CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections"
    SET "deleted" = 1
    WHERE "id" = OLD."id";

END;


# ============================================================
# PARTE 3 — UTILIZANDO O TRIGGER
# ============================================================

DELETE FROM "current_collections"
WHERE "title" = 'Imaginative landscape';


-- O DELETE na VIEW dispara o TRIGGER.
--
-- O TRIGGER executa:
--
-- UPDATE "collections"
-- SET "deleted" = 1
-- WHERE "id" = OLD."id";


SELECT * FROM "current_collections";


SELECT * FROM "collections";


# ============================================================
# PARTE 4 — TRIGGER PARA INSERT
# ============================================================

-- Podemos criar um TRIGGER para INSERT.
--
-- Neste caso, verificamos se o accession_number já existe.
--
-- Se existir, em vez de criar um novo registro,
-- reativamos o registro existente.


CREATE TRIGGER "insert_when_exists"

INSTEAD OF INSERT ON "current_collections"

FOR EACH ROW

WHEN NEW."accession_number" IN (

    SELECT "accession_number"
    FROM "collections"

)

BEGIN

    UPDATE "collections"

    SET "deleted" = 0

    WHERE "accession_number" = NEW."accession_number";

END;


# ============================================================
# PARTE 5 — TESTANDO O TRIGGER
# ============================================================

-- Estado atual da tabela.

SELECT * FROM "collections";


-- Tentando inserir novamente um registro que já existe.

INSERT INTO "current_collections"
    ("title", "accession_number", "acquired")

VALUES
    ('Imaginative landscape', '56.496', NULL);


-- O TRIGGER verifica o accession_number.
--
-- Como ele já existe, o registro é reativado:
--
-- deleted = 0


SELECT * FROM "collections";


-- Resultado esperado:
--
╭────┬─────────────────────────┬──────────────────┬────────────┬─────────╮
│ id │ title                   │ accession_number │ acquired   │ deleted │
╞════╪═════════════════════════╪══════════════════╪════════════╪═════════╡
│ 1  │ Farmers working at dawn │ 11.6152          │ 1911-08-03 │ 1       │
│ 2  │ Imaginative landscape   │ 56.496           │ NULL       │ 0       │
│ 3  │ Profusion of flowers    │ 56.257           │ 1956-04-12 │ 0       │
│ 4  │ Spring outing           │ 14.76            │ 1914-01-08 │ 0       │
╰────┴─────────────────────────┴──────────────────┴────────────┴─────────╯