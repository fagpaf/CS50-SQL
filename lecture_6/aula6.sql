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
-- =================================================================================================

-- STORED PROCEDURES
ALTER TABLE `collections`
ADD COLUMN `deleted` TINYINT DEFAULT 0;

delimiter //

CREATE PROCEDURE `current_collection`()
BEGIN
SELECT `title`, `accession_number`, `acquired`
FROM `collections` WHERE `deleted` = 0;
END//

delimiter ;

CALL `current_collection`();
+-------------------------+------------------+------------+
| title                   | accession_number | acquired   |
+-------------------------+------------------+------------+
| Farmers working at dawn | 11.6152          | 1911-08-03 |
| Imaginative landscape   | 56.496           | NULL       |
| Profusion of flowers    | 56.257           | 1956-04-12 |
| Spring outing           | 14.76            | 1914-01-08 |
+-------------------------+------------------+------------+

UPDATE `collections` SET `deleted` = 1
WHERE `title` = 'Farmers working at dawn';
+-----------------------+------------------+------------+
| title                 | accession_number | acquired   |
+-----------------------+------------------+------------+
| Imaginative landscape | 56.496           | NULL       |
| Profusion of flowers  | 56.257           | 1956-04-12 |
| Spring outing         | 14.76            | 1914-01-08 |
+-----------------------+------------------+------------+

CREATE TABLE `transactions`(
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR (64) NOT NULL,
    `action` ENUM('bougth', 'sold') NOT NULL,
    PRIMARY KEY(`id`)
);

delimiter //

CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN 
UPDATE `collections` SET `deleted` = 1
WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES(( SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END // 

delimiter ;

CALL `sell`(2);

SELECT * FROM `transactions`;
+----+-----------------------+--------+
| id | title                 | action |
+----+-----------------------+--------+
|  1 | Imaginative landscape | sold   |
+----+-----------------------+--------+


CREATE USER 'carter' INDENTIED BY 'password';



GRANT privilege, ... TO user;
REVOKE privilege, ... FROM user;

GRANT SELECT ON `rideshare`.`analysis` TO 'carter';
REVOKE SELECT ON `rideshare`.`analysis` FROM 'carter';

GRANT ALL ON *.* TO 'carter';
REVOKE ALL ON *.* FROM 'carter';

-- SQL Injection Attacks

SELECT* FROM `accounts`;
+----+---------+---------+
| id | name    | balance |
+----+---------+---------+
|  1 | Alice   |      10 |
|  2 | Bob     |      20 |
|  3 | Charlie |      30 |
+----+---------+---------+

SELECT* FROM `accounts`
WHERE `id` = 1;
+----+-------+---------+
| id | name  | balance |
+----+-------+---------+
|  1 | Alice |      10 |
+----+-------+---------+

SELECT* FROM `accounts`
WHERE `id` = 1 UNION
SELECT * FROM `accounts`;
+----+---------+---------+
| id | name    | balance |
+----+---------+---------+
|  1 | Alice   |      10 |
|  2 | Bob     |      20 |
|  3 | Charlie |      30 |
+----+---------+---------+

-- Prepared Statements
PREPARE `balance_check`
FROM 'SELECT * FROM `accounts`
WHERE `id` = ?';
'

SET @id = 1;

EXECUTE `balance_check` USING @id;
+----+-------+---------+
| id | name  | balance |
+----+-------+---------+
|  1 | Alice |      10 |
+----+-------+---------+

SET @id = '1 UNION SELECT * FROM `accounts`';
'

EXECUTE `balance_check` USING @id;
+----+-------+---------+
| id | name  | balance |
+----+-------+---------+
|  1 | Alice |      10 |
+----+-------+---------+

SELECT @id;
+----------------------------------+
| @id                              |
+----------------------------------+
| 1 UNION SELECT * FROM `accounts` |
+----------------------------------+

-- VER FORMAT STRING MALICIOSOS