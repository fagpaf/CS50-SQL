CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

-- ver esse nome da tabela
CREATE TABLE "check_ins" (
    "id" INTEGER,
    "flights_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("flights_id") REFERENCES "flights"("id")
);

-- verificar o saguão Temos 7 saguões: A, B, C, D, E, F e T.
CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- VERIFICAR O HORARIO
CREATE TABLE "flights" (
    "id" INTEGER,
    "airlines_id" INTEGER,
    "number" INTEGER NOT NULL,
    "departing_code" TEXT NOT NULL UNIQUE,
    "heading _code" TEXT NOT NULL UNIQUE,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIME,
    "arrival_time" NUMERIC NOT NULL DEFAULT CURRENT_TIME
);