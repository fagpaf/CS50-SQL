SELECT "english_title", "artist"
FROM "views"
-- Organiza todas as obras da mais brilhante para a menos brilhante.
ORDER BY "brightness" DESC
LIMIT 1;