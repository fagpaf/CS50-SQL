SELECT title, COUNT(title)
FROM votes
GROUP BY title;
╭────────────────────────────┬──────────────╮
│           title            │ COUNT(title) │
╞════════════════════════════╪══════════════╡
│ ' Imaginative landscape'   │            1 │
│ ' Spring outing'           │            1 │
│ Famers working at dawn     │            1 │
│ Farmers Working at Dawn    │            1 │
│ Farmers working            │            1 │
│ Farmers working at dawn    │            1 │
│ 'Farmers working at dawn ' │            1 │
│ 'Farmesr working at dawn ' │            1 │
│ Imaginative  landscape     │            1 │
│ Imaginative landscape      │            2 │
│ Imagintive landscape       │            1 │
│ Profusion                  │            1 │
│ Profusion of flowers       │            3 │
│ SPring outing              │            1 │
│ Spring outing              │            3 │
╰────────────────────────────┴──────────────╯

-- Remove espaços em branco extras no início e no final das strings
UPDATE "votes" SET "title" = trim("title");
╭─────────────────────────┬──────────────╮
│          title          │ COUNT(title) │
╞═════════════════════════╪══════════════╡
│ Famers working at dawn  │            1 │
│ Farmers Working at Dawn │            1 │
│ Farmers working         │            1 │
│ Farmers working at dawn │            2 │
│ Farmesr working at dawn │            1 │
│ Imaginative  landscape  │            1 │
│ Imaginative landscape   │            3 │
│ Imagintive landscape    │            1 │
│ Profusion               │            1 │
│ Profusion of flowers    │            3 │
│ SPring outing           │            1 │
│ Spring outing           │            4 │
╰─────────────────────────┴──────────────╯

-- Converte todos os caracteres para letras maiúsculas
UPDATE "votes" SET "title" = upper("title");
╭─────────────────────────┬──────────────╮
│          title          │ COUNT(title) │
╞═════════════════════════╪══════════════╡
│ FAMERS WORKING AT DAWN  │            1 │
│ FARMERS WORKING         │            1 │
│ FARMERS WORKING AT DAWN │            3 │
│ FARMESR WORKING AT DAWN │            1 │
│ IMAGINATIVE  LANDSCAPE  │            1 │
│ IMAGINATIVE LANDSCAPE   │            3 │
│ IMAGINTIVE LANDSCAPE    │            1 │
│ PROFUSION               │            1 │
│ PROFUSION OF FLOWERS    │            3 │
│ SPRING OUTING           │            5 │
╰─────────────────────────┴──────────────╯

-- Padroniza variações como 'FAMERS', 'FARMERS WORKING' para 'FARMERS WORKING AT DAWN'
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" LIKE 'Fa%';
╭─────────────────────────┬──────────────╮
│          title          │ COUNT(title) │
╞═════════════════════════╪══════════════╡
│ FARMERS WORKING AT DAWN │            6 │
│ IMAGINATIVE  LANDSCAPE  │            1 │
│ IMAGINATIVE LANDSCAPE   │            3 │
│ IMAGINTIVE LANDSCAPE    │            1 │
│ PROFUSION               │            1 │
│ PROFUSION OF FLOWERS    │            3 │
│ SPRING OUTING           │            5 │
╰─────────────────────────┴──────────────╯

-- Padroniza erros de digitação como 'IMAGINTIVE' ou espaços duplos para 'IMAGINATIVE LANDSCAPE'
UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
WHERE "title" LIKE 'Imag%';
╭─────────────────────────┬──────────────╮
│          title          │ COUNT(title) │
╞═════════════════════════╪══════════════╡
│ FARMERS WORKING AT DAWN │            6 │
│ IMAGINATIVE LANDSCAPE   │            5 │
│ PROFUSION               │            1 │
│ PROFUSION OF FLOWERS    │            3 │
│ SPRING OUTING           │            5 │
╰─────────────────────────┴──────────────╯

-- Unifica registros incompletos como apenas 'PROFUSION' para 'PROFUSION OF FLOWERS'
UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
WHERE "title" LIKE 'Profusion%';
╭─────────────────────────┬──────────────╮
│          title          │ COUNT(title) │
╞═════════════════════════╪══════════════╡
│ FARMERS WORKING AT DAWN │            6 │
│ IMAGINATIVE LANDSCAPE   │            5 │
│ PROFUSION OF FLOWERS    │            4 │
│ SPRING OUTING           │            5 │
╰─────────────────────────┴──────────────╯