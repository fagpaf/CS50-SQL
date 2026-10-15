# ------------------------------------------------------------
# 1. EXCLUSÃO LÓGICA
# ------------------------------------------------------------

# Em vez de remover um registro fisicamente, podemos marcá-lo
# como excluído.
#
# A coluna deleted funciona como um indicador:
# 0 = registro ativo
# 1 = registro marcado como excluído
#
# TINYINT é um tipo inteiro pequeno.

ALTER TABLE `collections`
ADD COLUMN `deleted` TINYINT DEFAULT 0;


# ------------------------------------------------------------
# 2. CRIANDO UMA STORED PROCEDURE
# ------------------------------------------------------------

# Uma stored procedure é um conjunto de instruções SQL armazenado
# no banco de dados e executado quando chamado.
#
# DELIMITER muda temporariamente o delimitador utilizado pelo
# cliente MySQL, permitindo escrever procedimentos com vários
# comandos terminados em ponto e vírgula.
#
# O delimitador // permite que o corpo da procedure contenha ;.

DELIMITER //

CREATE PROCEDURE `current_collection`()
BEGIN
    SELECT `title`, `accession_number`, `acquired`
    FROM `collections`
    WHERE `deleted` = 0;
END//

DELIMITER ;

# CALL executa a stored procedure.

CALL `current_collection`();

# Resultado:
#
# +-------------------------+------------------+------------+
# | title                   | accession_number | acquired   |
# +-------------------------+------------------+------------+
# | Farmers working at dawn | 11.6152          | 1911-08-03 |
# | Imaginative landscape   | 56.496           | NULL       |
# | Profusion of flowers    | 56.257           | 1956-04-12 |
# | Spring outing           | 14.76            | 1914-01-08 |
# +-------------------------+------------------+------------+


# ------------------------------------------------------------
# 3. MARCANDO UM REGISTRO COMO EXCLUÍDO
# ------------------------------------------------------------

# A operação abaixo não apaga o registro.
# Apenas altera deleted para 1.
#
# Como current_collection filtra deleted = 0, o registro deixa
# de aparecer no resultado da procedure.

UPDATE `collections`
SET `deleted` = 1
WHERE `title` = 'Farmers working at dawn';

# Resultado de uma nova chamada a current_collection:
#
# +-----------------------+------------------+------------+
# | title                 | accession_number | acquired   |
# +-----------------------+------------------+------------+
# | Imaginative landscape | 56.496           | NULL       |
# | Profusion of flowers  | 56.257           | 1956-04-12 |
# | Spring outing         | 14.76            | 1914-01-08 |
# +-----------------------+------------------+------------+


# ------------------------------------------------------------
# 4. REGISTRANDO TRANSAÇÕES DE VENDA
# ------------------------------------------------------------

# A tabela transactions registra operações realizadas sobre
# as coleções.
#
# ENUM limita action aos valores definidos.
#
# Correção: 'bougth' foi escrito incorretamente no rascunho.
# A grafia correta em inglês é 'bought'.

CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `action` ENUM('bought', 'sold') NOT NULL,
    PRIMARY KEY (`id`)
);


# ------------------------------------------------------------
# 5. PROCEDURE COM PARÂMETRO IN
# ------------------------------------------------------------

# IN indica que sold_id é um parâmetro de entrada.
#
# A procedure:
# 1. Marca a coleção como excluída.
# 2. Busca seu título.
# 3. Registra a venda na tabela transactions.

DELIMITER //

CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
    UPDATE `collections`
    SET `deleted` = 1
    WHERE `id` = `sold_id`;

    INSERT INTO `transactions` (`title`, `action`)
    VALUES (
        (SELECT `title`
         FROM `collections`
         WHERE `id` = `sold_id`),
        'sold'
    );
END//

DELIMITER ;

# Executa a procedure para a coleção de ID 2.

CALL `sell`(2);

SELECT * FROM `transactions`;

# Resultado:
#
# +----+-----------------------+--------+
# | id | title                 | action |
# +----+-----------------------+--------+
# | 1  | Imaginative landscape | sold   |
# +----+-----------------------+--------+

# Observação:
# Este exemplo é didático. Em uma aplicação real, é importante
# tratar IDs inexistentes, vendas repetidas e falhas durante
# a operação. Também é necessário considerar transações para
# manter as alterações consistentes.