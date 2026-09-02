-- ============================================================
-- 1. SELECT — SELECIONANDO DADOS
-- ============================================================

-- SELECT define quais colunas queremos retornar.
-- * significa "todas as colunas".
-- Útil para explorar uma tabela pela primeira vez.

SELECT * FROM "longlist";


-- ============================================================
-- 2. LIMIT — LIMITANDO RESULTADOS
-- ============================================================

-- LIMIT limita a quantidade de LINHAS retornadas.
-- Não escolhe quais são as melhores/piores linhas.
-- Sem ORDER BY, a ordem dos registros não deve ser assumida.

SELECT "title"
FROM "longlist"
LIMIT 10;


-- ============================================================
-- 3. WHERE — FILTRANDO LINHAS
-- ============================================================

-- WHERE filtra as linhas de acordo com uma condição.

-- Livros publicados em 2021:

SELECT "title", "author"
FROM "longlist"
WHERE "year" = 2021;


-- Operadores de comparação:
--
-- =   igual
-- !=  diferente
-- <>  diferente
-- >   maior que
-- <   menor que
-- >=  maior ou igual
-- <=  menor ou igual


-- Livros com menos de 300 páginas:

SELECT "title", "pages"
FROM "longlist"
WHERE "pages" < 300;


-- Livros cujo formato é diferente de "hardcover":

SELECT "title", "format"
FROM "longlist"
WHERE "format" != 'hardcover';

-- ============================================================
-- 4. LIKE — BUSCA POR PADRÕES
-- ============================================================

-- LIKE permite procurar padrões dentro de strings.


-- % representa QUALQUER SEQUÊNCIA de caracteres.
--
-- '%love%'
-- significa que "love" pode aparecer em qualquer posição.

SELECT "title"
FROM "longlist"
WHERE "title" LIKE '%love%';


-- 'the%'
-- significa que o texto começa com "the".
-- Depois de "the" pode existir qualquer sequência de caracteres.

SELECT "title"
FROM "longlist"
WHERE "title" LIKE 'the%';


-- '%the'
-- significa que o texto termina com "the".


-- _ representa EXATAMENTE UM caractere.
--
-- O "_" funciona como um espaço reservado para um único caractere.

SELECT "title"
FROM "longlist"
WHERE "title" LIKE 'p_re';


-- RESUMO:
--
-- %  -> qualquer quantidade de caracteres
-- _  -> exatamente um caractere


-- ============================================================
-- GUIA GERAL
-- ============================================================

-- SELECT  -> quais colunas quero?
-- FROM    -> de qual tabela?
-- JOIN    -> qual outra tabela preciso?
-- ON      -> como as tabelas se relacionam?
-- WHERE   -> quais linhas quero?
-- AND     -> todas as condições devem ser verdadeiras
-- OR      -> pelo menos uma condição deve ser verdadeira
-- NOT     -> inverte uma condição
-- IS NULL -> valor ausente
-- LIKE    -> busca por padrão de texto
-- BETWEEN -> intervalo inclusivo
-- ORDER BY-> ordena resultados
-- ASC     -> crescente
-- DESC    -> decrescente
-- LIMIT   -> limita quantidade de linhas
-- MIN()   -> menor valor
-- MAX()   -> maior valor
-- AVG()   -> média
-- SUM()   -> soma
-- COUNT() -> contagem
-- AS      -> alias/nome alternativo
-- ============================================================