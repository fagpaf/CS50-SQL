**Simulado de SQL - Revisao para Prova**

**TEMA 1: JOINS (INNER, LEFT, RIGHT, FULL)**

**Questao 1:**
Liste os títulos dos artigos e as siglas dos eventos em que eles foram publicados, mesmo que alguns artigos não tenham evento associado.
> Dica: Use LEFT JOIN

**Questao 2:**
Liste os nomes dos pesquisadores e os títulos de seus respectivos artigos publicados em português ou inglês, utilizando INNER JOIN.

---

**TEMA 2: FUNÇÕES DE AGREGAÇÃO + GROUP BY + HAVING**

**Questao 3:**
Liste as siglas dos eventos cuja média das notas dos artigos seja maior que 8.

**Questao 4:**
Mostre o nome das instituições que possuem mais de 3 pesquisadores cadastrados.

---

**TEMA 3: SUBCONSULTAS (IN, EXISTS, ALL, ANY, NOT IN, etc)**

**Questao 5:**
Liste os títulos dos artigos com nota acima da média geral de todos os artigos.

**Questao 6:**
Liste os nomes dos pesquisadores que não publicaram nenhum artigo com nota atribuída (ou seja, todos os seus artigos estão sem nota).

---

**TEMA 4: FUNÇÕES DE TEXTO, DATA e CASE**

**Questao 7:**
Liste os nomes dos pesquisadores com letras minúsculas e suas instituições com letras maiúsculas.

**Questao 8:**
Mostre o título dos artigos e a classificação da nota segundo a regra:
- >= 8: BOM
- >= 6: REGULAR
- < 6: RUIM
Use CASE.

---

**TEMA 5: FILTROS (LIKE, IN, IS NULL, BETWEEN, AND/OR)**

**Questao 9:**
Liste os artigos que ainda não foram publicados (ou seja, não possuem evento associado).

**Questao 10:**
Liste os nomes dos pesquisadores cujo nome tem exatamente 10 letras e começa com a letra R.

---

**TEMA EXTRA: EXERCÍCIOS COMPARATIVOS COM E SEM JOIN**

**Questao 11:**
Liste os nomes dos pesquisadores e os títulos dos artigos escritos por eles, em português ou inglês, **sem usar JOIN**.

**Questao 12:**
Refaça a questão anterior, agora utilizando **INNER JOIN**.

**Questao 13:**
Liste todos os títulos dos artigos e as siglas dos eventos quando publicados. Mostre também os artigos **ainda não publicados**.
> Dica: use LEFT JOIN

**Questao 14:**
Liste todas as siglas dos eventos e os títulos dos artigos, **incluindo os eventos sem artigos**.
> Dica: use RIGHT JOIN

**Questao 15:**
Liste os títulos dos artigos e siglas dos eventos, **incluindo artigos não publicados e eventos sem artigos**.
> Dica: use FULL OUTER JOIN

**Questao 16:**
Liste os nomes dos pesquisadores que escreveram artigos com nota maior que 8, **sem usar JOIN**.

**Questao 17:**
Liste os nomes dos pesquisadores e a quantidade de artigos que escreveram. Mostre apenas quem escreveu mais de 2 artigos.
> Dica: use JOIN + GROUP BY + HAVING

**Questao 18:**
Mostre as siglas dos eventos cuja média das notas dos artigos publicados seja acima de 7.

**Questao 19:**
Liste os nomes dos pesquisadores que nunca publicaram um artigo (ou seja, não aparecem na tabela ESCREVE).
> Dica: use LEFT JOIN com IS NULL

**Questao 20:**
Liste os nomes dos pesquisadores que não escreveram artigos com nota (todos os artigos estão sem nota).
> Dica: use NOT IN

