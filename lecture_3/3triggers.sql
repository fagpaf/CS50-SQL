-- Cria uma nova trigger (gatilho) chamada "sell"
CREATE TRIGGER "sell"

-- Define que o gatilho será executado ANTES de uma instrução DELETE acontecer na tabela "collections"
BEFORE DELETE ON "collections"

-- Garante que a ação do gatilho será executada individualmente para cada registro removido
FOR EACH ROW

BEGIN
    -- Insere um registro na tabela de histórico "transactions"
    -- Captura o título da obra que está sendo deletada (usando o prefixo OLD) e define a ação como 'sold'
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

DELETE FROM "collections" WHERE "title" = 'Profusion of flowers';
╭────┬──────────────────────┬────────╮
│ id │        title         │ action │
╞════╪══════════════════════╪════════╡
│  1 │ Profusion of flowers │ sold   │
╰────┴──────────────────────┴────────╯


-- CREATE TRIGGER "sell"
-- BEFORE DELETE ON "collections"
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO "transactions" ("title", "action")
--     VALUES (OLD."title", 'sold');
-- END;

CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;

INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Profusion of flowers', '56.247', '1956-04-12');

SELECT * FROM transactions;

╭────┬──────────────────────┬────────╮
│ id │        title         │ action │
╞════╪══════════════════════╪════════╡
│  1 │ Profusion of flowers │ sold   │
│  2 │ Profusion of flowers │ bought │
╰────┴──────────────────────┴────────╯