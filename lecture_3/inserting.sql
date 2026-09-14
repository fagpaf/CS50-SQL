-- Adds a new item to the collections
INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');

INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (2, 'Farmers working at dawn', '11.6152', '1911-08-03');

INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Spring outing', '14.76', '1914-01-08');

-- INSERT INTO "collections" ("title", "accession_number", "acquired")
-- VALUES ('Spring outing', '14.76', '1914-01-08');

-- INSERT INTO "collections" ("title", "accession_number", "acquired")
-- VALUES (NULL, '56.496', '1914-01-08');

-- INSERINDO VÁRIAS LINHAS DE UMA SÓ VEZ
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES
('Imaginative landscape', '53.496', NULL),
('Peonies and butterfly', '06.1899', '1906-01-01');