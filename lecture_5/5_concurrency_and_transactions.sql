# ============================================================
# PARTE 1 — CONCORRÊNCIA
# ============================================================

-- CONCORRÊNCIA
--
-- Trata da situação em que múltiplas operações podem ocorrer
-- ao mesmo tempo sobre o banco de dados.
--
-- É importante garantir que essas operações não causem
-- inconsistências nos dados.


# ============================================================
# PARTE 2 — ACID
# ============================================================

-- Transações em bancos de dados possuem propriedades
-- conhecidas pela sigla ACID.
--
-- A = Atomicidade
-- C = Consistência
-- I = Isolamento
-- D = Durabilidade


# ============================================================
# PARTE 3 — ATOMICIDADE
# ============================================================

-- Uma transação deve ser tratada como uma unidade.
--
-- Ou todas as operações são realizadas,
-- ou nenhuma delas deve ser aplicada.


# ============================================================
# PARTE 4 — CONSISTÊNCIA
# ============================================================

-- A transação deve levar o banco de dados de um estado
-- consistente para outro estado consistente.


# ============================================================
# PARTE 5 — ISOLAMENTO
# ============================================================

-- Operações concorrentes não devem interferir de maneira
-- indevida umas nas outras.


# ============================================================
# PARTE 6 — DURABILIDADE
# ============================================================

-- Depois que uma transação é confirmada, seus efeitos devem
-- permanecer no banco de dados.


# ============================================================
# PARTE 7 — TRANSACTIONS
# ============================================================

-- Uma transação pode ser iniciada com BEGIN TRANSACTION.

BEGIN TRANSACTION;


-- ...
--
-- Operações da transação.


COMMIT;


# ============================================================
# PARTE 8 — EXEMPLO COM ACCOUNTS
# ============================================================

-- Estado inicial da tabela:

SELECT * FROM "accounts";


-- Resultado:
--
-- ┌────┬─────────┬─────────┐
-- │ id │  name   │ balance │
-- ├────┼─────────┼─────────┤
-- │ 1  │ Alice   │ 10      │
-- │ 2  │ Bob     │ 20      │
-- │ 3  │ Charlie │ 30      │
-- └────┴─────────┴─────────┘


# ============================================================
# PARTE 9 — EXECUTANDO UMA TRANSAÇÃO
# ============================================================

BEGIN TRANSACTION;


-- Adicionando 10 ao saldo de Bob.

UPDATE "accounts"

SET "balance" = "balance" + 10

WHERE "id" = 2;


-- Confirmando a transação.

COMMIT;


# ============================================================
# PARTE 10 — RACE CONDITIONS
# ============================================================

-- RACE CONDITION
--
-- Pode ocorrer quando duas ou mais operações concorrentes
-- dependem da mesma informação e o resultado depende da
-- ordem em que essas operações são executadas.


# ============================================================
# PARTE 11 — TABELA MUTANTE
# ============================================================

-- Tabela mutante é uma situação relacionada à concorrência
-- em que uma tabela pode ser alterada enquanto uma operação
-- ainda está utilizando seus dados.
--
-- Esse conceito aparece junto dos problemas de concorrência
-- tratados na aula.


# ============================================================
# PARTE 12 — LOCKS
# ============================================================

-- LOCKS são mecanismos utilizados para controlar o acesso
-- concorrente aos dados.
--
-- Eles ajudam a impedir que operações simultâneas causem
-- conflitos ou inconsistências.