# ============================================================
# PARTE 1 — VACUUM
# ============================================================

-- VACUUM é utilizado para reorganizar/limpar o espaço
-- utilizado pelo banco de dados.
--
-- Quando registros são apagados, o espaço em disco que eles
-- ocupavam pode continuar fazendo parte do arquivo.
--
-- VACUUM reorganiza o arquivo do banco de dados.
--
-- Na anotação da aula:
--
-- "Limpa a memória em disco dos arquivos 'apagados' via DROP"


# ============================================================
# PARTE 2 — EXECUTANDO VACUUM
# ============================================================

VACUUM;


# ============================================================
# PARTE 3 — IDEIA PRINCIPAL
# ============================================================

-- DELETE / DROP
--      ↓
-- espaço pode ficar disponível dentro do arquivo
--      ↓
-- VACUUM
--      ↓
-- reorganização do arquivo do banco