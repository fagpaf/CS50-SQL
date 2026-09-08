CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    "passsword" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "localization" TEXT NOT NULL,
    "foudation" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "section" TEXT NOT NULL,
    "localization" 