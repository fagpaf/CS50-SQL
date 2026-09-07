-- ============================================================
-- AULA 02 — CRIANDO TABELAS
-- ============================================================


-- ============================================================
-- 1. TIPOS DE DADOS
-- ============================================================

-- INTEGER → números inteiros
-- REAL    → números com casas decimais
-- NUMERIC → valores numéricos
-- TEXT    → texto
-- BLOB    → dados binários


-- ============================================================
-- 2. CRIANDO UMA TABELA
-- ============================================================

CREATE TABLE IF NOT EXISTS "cards" (
    "id" INTEGER,
    PRIMARY KEY("id")
);

-- IF NOT EXISTS → cria a tabela somente se ela ainda não existir.


-- ============================================================
-- 3. RESTRIÇÕES (CONSTRAINTS)
-- ============================================================

-- PRIMARY KEY
-- Identifica unicamente cada registro.
-- Não pode haver dois registros com a mesma chave.

CREATE TABLE "cards" (
    "id" INTEGER,
    PRIMARY KEY("id")
);


-- NOT NULL
-- Impede que a coluna receba NULL.

"name" TEXT NOT NULL


-- UNIQUE
-- Impede valores duplicados na coluna.

"name" TEXT NOT NULL UNIQUE


-- CHECK
-- Impõe uma condição que o valor deve respeitar.

"amount" NUMERIC NOT NULL CHECK("amount" <> 0)


-- DEFAULT
-- Define um valor padrão caso nenhum seja informado.

"datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP


-- ============================================================
-- 4. FOREIGN KEY
-- ============================================================

-- Cria um relacionamento entre tabelas.
-- A coluna referencia a PRIMARY KEY de outra tabela.

FOREIGN KEY("card_id") REFERENCES "cards"("id")

-- card_id → coluna da tabela atual
-- cards(id) → coluna que está sendo referenciada


-- ============================================================
-- 5. EXEMPLO COMPLETO
-- ============================================================

CREATE TABLE IF NOT EXISTS "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "swipes" (
    "id" INTEGER,
    "card_id" INTEGER,
    "station_id" INTEGER,
    "type" TEXT NOT NULL CHECK("type" IN ('enter', 'exit', 'deposit')),
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" NUMERIC NOT NULL CHECK("amount" <> 0),

    PRIMARY KEY("id"),

    FOREIGN KEY("card_id") REFERENCES "cards"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);


-- ============================================================
-- 6. ALTERANDO TABELAS
-- ============================================================

-- ALTER TABLE → modifica uma tabela existente.


-- Adicionar uma coluna:
ALTER TABLE tabela
ADD COLUMN coluna TIPO;


-- Renomear uma tabela:
ALTER TABLE tabela
RENAME TO nova_tabela;


-- Remover uma coluna:
ALTER TABLE tabela
DROP COLUMN coluna;


-- Remover uma tabela inteira:
DROP TABLE tabela;


-- ============================================================
-- 7. RESUMO — CONSTRAINTS
-- ============================================================

-- PRIMARY KEY → identifica unicamente o registro
-- FOREIGN KEY → relaciona tabelas
-- NOT NULL     → não permite NULL
-- UNIQUE       → não permite duplicados
-- CHECK        → exige uma condição
-- DEFAULT      → valor padrão