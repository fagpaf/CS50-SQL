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
    "passengers_id" INTEGER,
    "flights_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passengers_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flights_id") REFERENCES "flights"("id")
);

-- verificar o saguão Temos 7 saguões: A, B, C, D, E, F e T.
CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY ("id")
);

-- VERIFICAR O HORARIO
CREATE TABLE "flights" (
    "id" INTEGER,
    "airlines_id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "departing_airport_code" TEXT NOT NULL,
    "heading_airport_code" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airlines_id") REFERENCES "airlines"("id")
);