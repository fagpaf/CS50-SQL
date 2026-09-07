SELECT year, ROUND(AVG(salary), 2) AS "average salary"
FROM salaries
GROUP BY year
ORDER BY year DESC;

-- Regra de ouro para o SQL:
-- Sempre que você usar uma função de agregação (como AVG, SUM, COUNT) junto com uma coluna comum no SELECT (como year),
-- Essa coluna comum deve estar presente na cláusula GROUP BY.