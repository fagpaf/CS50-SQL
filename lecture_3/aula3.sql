-- COMANDO SQLITE para importar um arquivo CSV para uma tabela no banco de dados.
.import --csv --skip 1 mfa.csv collections

-- Iportando para uma tabela temporária
.import --csv mfa.csv temp 

DELETE FROM "collections";
SELECT * FROM collections;
INSERT INTO "collections" ("title", "accession_number", "acquired")
SELECT "title", "accession_number", "acquired" FROM "temp";

SELECT * FROM collections;
╭────┬─────────────────────────┬──────────────────┬────────────╮
│ id │          title          │ accession_number │  acquired  │
╞════╪═════════════════════════╪══════════════════╪════════════╡
│  1 │ Profusion of flowers    │ '56.257'         │ 1956-04-12 │
│  2 │ Farmers working at dawn │ '11.6152'        │ 1911-08-03 │
│  3 │ Spring outing           │ '14.76'          │ 1914-01-08 │
│  4 │ Imaginative landscape   │ '56.496'         │            │
│  5 │ Peonies and butterfly   │ '06.1899'        │ 1906-01-01 │
╰────┴─────────────────────────┴──────────────────┴────────────╯

--
sqlite> DELETE FROM "collections" WHERE "title"  = 'Spring outing';
sqlite> SELECT * FROM collections;
╭────┬─────────────────────────┬──────────────────┬────────────╮
│ id │          title          │ accession_number │  acquired  │
╞════╪═════════════════════════╪══════════════════╪════════════╡
│  1 │ Profusion of flowers    │ '56.257'         │ 1956-04-12 │
│  2 │ Farmers working at dawn │ '11.6152'        │ 1911-08-03 │
│  4 │ Imaginative landscape   │ '56.496'         │            │
│  5 │ Peonies and butterfly   │ '06.1899'        │ 1906-01-01 │
╰────┴─────────────────────────┴──────────────────┴────────────╯

--
sqlite> DELETE FROM "collections" WHERE "acquired"  = '';          
sqlite> SELECT * FROM collections;
╭────┬─────────────────────────┬──────────────────┬────────────╮
│ id │          title          │ accession_number │  acquired  │
╞════╪═════════════════════════╪══════════════════╪════════════╡
│  1 │ Profusion of flowers    │ '56.257'         │ 1956-04-12 │
│  2 │ Farmers working at dawn │ '11.6152'        │ 1911-08-03 │
│  5 │ Peonies and butterfly   │ '06.1899'        │ 1906-01-01 │
╰────┴─────────────────────────┴──────────────────┴────────────╯

sqlite> DELETE FROM "collections" WHERE "acquired" < '1909-01-01';
sqlite> SELECT * FROM collections;
╭────┬─────────────────────────┬──────────────────┬────────────╮
│ id │          title          │ accession_number │  acquired  │
╞════╪═════════════════════════╪══════════════════╪════════════╡
│  1 │ Profusion of flowers    │ '56.257'         │ 1956-04-12 │
│  2 │ Farmers working at dawn │ '11.6152'        │ 1911-08-03 │
╰────┴─────────────────────────┴──────────────────┴────────────╯