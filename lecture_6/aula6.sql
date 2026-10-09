-- MYSQL

CREATE TABLE `cards`(
    `id` INT AUTO_INCREMENT,
    PRIMARY KEY(`id`)
);
+-------+------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra          |
+-------+------+------+-----+---------+----------------+
| id    | int  | NO   | PRI | NULL    | auto_increment |
+-------+------+------+-----+---------+----------------+

CREATE TABLE `stations` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `line` ENUM('blue', 'red', 'green', 'orange') NOT NULL,
    PRIMARY KEY(`id`)
);

+-------+-------------------------------------+------+-----+---------+----------------+
| Field | Type                                | Null | Key | Default | Extra          |
+-------+-------------------------------------+------+-----+---------+----------------+
| id    | int                                 | NO   | PRI | NULL    | auto_increment |
| name  | varchar(32)                         | NO   | UNI | NULL    |                |
| line  | enum('blue','red','green','orange') | NO   |     | NULL    |                |
+-------+-------------------------------------+------+-----+---------+----------------+
-- VARCHAR aceita strings de tamanho fixo definido nos parênteses

CREATE TABLE IF NOT EXISTS `swipes` (
    `id` INT AUTO_INCREMENT,
    `card_id` INT,
    `station_id` INT,
    `type` ENUM('enter', 'exit', 'deposit') NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(5,2) NOT NULL CHECK(`amount` != 0),

    PRIMARY KEY(`id`),
    FOREIGN KEY(`card_id`) REFERENCES `cards`(`id`),
    FOREIGN KEY(`station_id`) REFERENCES `stations`(`id`)
);

+------------+--------------------------------+------+-----+-------------------+-------------------+
| Field      | Type                           | Null | Key | Default           | Extra             |
+------------+--------------------------------+------+-----+-------------------+-------------------+
| id         | int                            | NO   | PRI | NULL              | auto_increment    |
| card_id    | int                            | YES  | MUL | NULL              |                   |
| station_id | int                            | YES  | MUL | NULL              |                   |
| type       | enum('enter','exit','deposit') | NO   |     | NULL              |                   |
| datetime   | datetime                       | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| amount     | decimal(5,2)                   | NO   |     | NULL              |                   |
+------------+--------------------------------+------+-----+-------------------+-------------------+


ALTER TABLE `stations`
MODIFY `line` ENUM('blue', 'red', 'green', 'orange', 'silver') NOT NULL;
+-------+----------------------------------------------+------+-----+---------+----------------+
| Field | Type                                         | Null | Key | Default | Extra          |
+-------+----------------------------------------------+------+-----+---------+----------------+
| id    | int                                          | NO   | PRI | NULL    | auto_increment |
| name  | varchar(32)                                  | NO   | UNI | NULL    |                |
| line  | enum('blue','red','green','orange','silver') | NO   |     | NULL    |                |
+-------+----------------------------------------------+------+-----+---------+----------------+
