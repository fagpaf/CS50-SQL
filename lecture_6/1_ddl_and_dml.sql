# ------------------------------------------------------------
# 1. AUTO_INCREMENT E PRIMARY KEY
# ------------------------------------------------------------

# AUTO_INCREMENT gera automaticamente um identificador numérico.
# PRIMARY KEY identifica unicamente cada registro da tabela.

CREATE TABLE `cards` (
    `id` INT AUTO_INCREMENT,
    PRIMARY KEY (`id`)
);

# Estrutura resultante:
#
# +-------+------+------+-----+---------+----------------+
# | Field | Type | Null | Key | Default | Extra          |
# +-------+------+------+-----+---------+----------------+
# | id    | int  | NO   | PRI | NULL    | auto_increment |
# +-------+------+------+-----+---------+----------------+


# ------------------------------------------------------------
# 2. VARCHAR, ENUM E UNIQUE
# ------------------------------------------------------------

# VARCHAR(32): permite strings de até 32 caracteres.
# NOT NULL: impede valores nulos.
# UNIQUE: impede valores repetidos nessa coluna.
# ENUM: restringe os valores aos elementos definidos.

CREATE TABLE `stations` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `line` ENUM('blue', 'red', 'green', 'orange') NOT NULL,
    PRIMARY KEY (`id`)
);

# Estrutura resultante:
#
# +-------+-------------------------------------+------+-----+---------+----------------+
# | Field | Type                                | Null | Key | Default | Extra          |
# +-------+-------------------------------------+------+-----+---------+----------------+
# | id    | int                                 | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(32)                         | NO   | UNI | NULL    |                |
# | line  | enum('blue','red','green','orange') | NO   |     | NULL    |                |
# +-------+-------------------------------------+------+-----+---------+----------------+


# ------------------------------------------------------------
# 3. FOREIGN KEY, DATETIME, DECIMAL E CHECK
# ------------------------------------------------------------

# IF NOT EXISTS: cria a tabela somente se ela ainda não existir.
# FOREIGN KEY: estabelece um relacionamento com outra tabela.
# DATETIME: armazena data e horário.
# DEFAULT CURRENT_TIMESTAMP: usa a data e hora atuais como padrão.
# DECIMAL(5,2): permite até 5 dígitos, sendo 2 casas decimais.
# CHECK: estabelece uma condição que os valores devem satisfazer.
#
# card_id referencia cards(id).
# station_id referencia stations(id).
# Os campos card_id e station_id aceitam NULL porque não possuem
# a restrição NOT NULL.

CREATE TABLE IF NOT EXISTS `swipes` (
    `id` INT AUTO_INCREMENT,
    `card_id` INT,
    `station_id` INT,
    `type` ENUM('enter', 'exit', 'deposit') NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(5,2) NOT NULL CHECK (`amount` != 0),

    PRIMARY KEY (`id`),
    FOREIGN KEY (`card_id`) REFERENCES `cards`(`id`),
    FOREIGN KEY (`station_id`) REFERENCES `stations`(`id`)
);

# Estrutura resultante:
#
# +------------+--------------------------------+------+-----+-------------------+-------------------+
# | Field      | Type                           | Null | Key | Default           | Extra             |
# +------------+--------------------------------+------+-----+-------------------+-------------------+
# | id         | int                            | NO   | PRI | NULL              | auto_increment    |
# | card_id    | int                            | YES  | MUL | NULL              |                   |
# | station_id | int                            | YES  | MUL | NULL              |                   |
# | type       | enum('enter','exit','deposit') | NO   |     | NULL              |                   |
# | datetime   | datetime                       | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
# | amount     | decimal(5,2)                   | NO   |     | NULL              |                   |
# +------------+--------------------------------+------+-----+-------------------+-------------------+


# ------------------------------------------------------------
# 4. ALTER TABLE E MODIFY
# ------------------------------------------------------------

# ALTER TABLE modifica a estrutura de uma tabela existente.
# MODIFY altera a definição de uma coluna.
#
# Aqui, a coluna line passa a aceitar também o valor 'silver'.

ALTER TABLE `stations`
MODIFY `line` ENUM('blue', 'red', 'green', 'orange', 'silver') NOT NULL;

# Estrutura resultante:
#
# +-------+----------------------------------------------+------+-----+---------+----------------+
# | Field | Type                                         | Null | Key | Default | Extra          |
# +-------+----------------------------------------------+------+-----+---------+----------------+
# | id    | int                                          | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(32)                                  | NO   | UNI | NULL    |                |
# | line  | enum('blue','red','green','orange','silver') | NO   |     | NULL    |                |
# +-------+----------------------------------------------+------+-----+---------+----------------+