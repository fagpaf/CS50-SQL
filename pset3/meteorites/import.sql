CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" REAL,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat"  = NULL WHERE "lat"  = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';
-------------------------------------------------------------

UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "lat"  = ROUND("lat", 2)  WHERE "lat"  IS NOT NULL;
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2) WHERE "long" IS NOT NULL;
------------------------------------------------------------------------------

-- Aqui eu faço a tabela do modo correto, do modo q vai ser usado de vdd
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL,
    "year" REAL,
    "lat" REAL,
    "long" REAL
);

-- Na inserção eu ordeno e retiro as linhas q contém 'Relict', PQ no INSERT eu posso utilizar SELECT

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

DROP TABLE meteorites_temp;