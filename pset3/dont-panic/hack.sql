-- Insere o log falso incriminando a emily33
INSERT INTO "user_logs" ("type", "old_password", "new_password")
VALUES (
    'insert',
    (SELECT "password" FROM "users" WHERE "username" = 'admin'),
    (SELECT "password" FROM "users" WHERE "username" = 'emily33')
);

DROP TRIGGER IF EXISTS "user_logs";
DROP TRIGGER IF EXISTS "log_user_updates";

-- Altera a senha do admin para "oops!" 
UPDATE "users" 
SET "password" = '982c0381c279d139fd221fce974916e7' 
WHERE "username" = 'admin';




-- 1. Cria um trigger para apagar automaticamente qualquer log de alteração para a nova senha do admin
CREATE TRIGGER "remove_admin_log"
AFTER INSERT ON "user_logs"
FOR EACH ROW
WHEN NEW."new_password" = '982c0381c279d139fd221fce974916e7'
BEGIN
    DELETE FROM "user_logs" WHERE "id" = NEW."id";
END;

-- 2. Altera a senha do admin para "oops!" em MD5
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- 3. Insere o log falso incriminando a emily33 com todas as colunas necessárias
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES (
    'update',
    'admin',
    'admin',
    (SELECT "password" FROM "users" WHERE "username" = 'admin'),
    (SELECT "password" FROM "users" WHERE "username" = 'emily33')
);
