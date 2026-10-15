# ------------------------------------------------------------
# 1. CONSULTANDO A TABELA ACCOUNTS
# ------------------------------------------------------------

SELECT * FROM `accounts`;

# Resultado:
#
# +----+---------+---------+
# | id | name    | balance |
# +----+---------+---------+
# | 1  | Alice   | 10      |
# | 2  | Bob     | 20      |
# | 3  | Charlie | 30      |
# +----+---------+---------+


# ------------------------------------------------------------
# 2. CONSULTA COM CONDIÇÃO
# ------------------------------------------------------------

# Seleciona a conta cujo ID é 1.

SELECT *
FROM `accounts`
WHERE `id` = 1;

# Resultado:
#
# +----+-------+---------+
# | id | name  | balance |
# +----+-------+---------+
# | 1  | Alice | 10      |
# +----+-------+---------+


# ------------------------------------------------------------
# 3. EXEMPLO DE SQL INJECTION
# ------------------------------------------------------------

# UNION combina os resultados de duas consultas compatíveis.
#
# Neste exemplo, a segunda consulta retorna todas as contas.
# O resultado inclui, portanto, os registros das duas consultas.
#
# Em uma aplicação vulnerável, um atacante pode tentar inserir
# SQL malicioso em um campo que deveria receber apenas um valor.
#
# Esta consulta demonstra o comportamento do UNION; ela não
# simula, sozinha, uma aplicação vulnerável.

SELECT *
FROM `accounts`
WHERE `id` = 1

UNION

SELECT *
FROM `accounts`;

# Resultado:
#
# +----+---------+---------+
# | id | name    | balance |
# +----+---------+---------+
# | 1  | Alice   | 10      |
# | 2  | Bob     | 20      |
# | 3  | Charlie | 30      |
# +----+---------+---------+


# ------------------------------------------------------------
# 4. PREPARED STATEMENTS
# ------------------------------------------------------------

# Prepared Statements permitem preparar uma instrução SQL
# separadamente dos valores que serão utilizados nela.
#
# O ? é um marcador de parâmetro.
# O valor fornecido posteriormente é tratado como dado, e não
# como parte executável da instrução SQL.
#
# Correção: as aspas simples isoladas que apareciam depois dos
# comandos SET no rascunho foram removidas.

PREPARE `balance_check`
FROM 'SELECT * FROM `accounts` WHERE `id` = ?';
'

# ------------------------------------------------------------
# 5. EXECUTANDO COM UM VALOR NUMÉRICO
# ------------------------------------------------------------

# Variáveis de sessão do MySQL podem ser identificadas pelo @.
# Aqui, @id recebe o valor 1.

SET @id = 1;

# EXECUTE executa a instrução preparada usando @id como parâmetro.

EXECUTE `balance_check` USING @id;

# Resultado:
#
# +----+-------+---------+
# | id | name  | balance |
# +----+-------+---------+
# | 1  | Alice | 10      |
# +----+-------+---------+


# ------------------------------------------------------------
# 6. TESTANDO UMA ENTRADA QUE CONTÉM SQL
# ------------------------------------------------------------

# Agora @id recebe uma string que contém texto semelhante a
# uma tentativa de SQL Injection.
#
# Como o valor é passado como parâmetro, ele não é incorporado
# à estrutura SQL da instrução preparada.

SET @id = '1 UNION SELECT * FROM `accounts`';
'
EXECUTE `balance_check` USING @id;

# Resultado esperado no exemplo:
#
# +----+-------+---------+
# | id | name  | balance |
# +----+-------+---------+
# | 1  | Alice | 10      |
# +----+-------+---------+
#
# A comparação numérica pode converter a string para um valor
# numérico, conforme as regras de conversão do MySQL.
# O conteúdo UNION não é executado como uma nova instrução SQL.


# ------------------------------------------------------------
# 7. CONFERINDO O VALOR DA VARIÁVEL
# ------------------------------------------------------------

SELECT @id;

# Resultado:
#
# +----------------------------------+
# | @id                              |
# +----------------------------------+
# | 1 UNION SELECT * FROM `accounts` |
# +----------------------------------+


# ------------------------------------------------------------
# 8. ENCERRANDO O PREPARED STATEMENT
# ------------------------------------------------------------

# Libera a instrução preparada quando ela não for mais necessária.

DEALLOCATE PREPARE `balance_check`;