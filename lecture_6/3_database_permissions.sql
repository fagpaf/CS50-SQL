# ------------------------------------------------------------
# 1. CRIANDO UM USUÁRIO
# ------------------------------------------------------------

# CREATE USER cria uma conta no MySQL.
#
# Correção de sintaxe:
# IDENTIFIED estava escrito incorretamente como INDENTIED.
#
# A senha abaixo é apenas um exemplo didático.
# Em ambientes reais, use uma senha forte e não a exponha
# em scripts compartilhados.

CREATE USER 'carter' IDENTIFIED BY 'password';


# ------------------------------------------------------------
# 2. GRANT E REVOKE
# ------------------------------------------------------------

# GRANT concede permissões.
# REVOKE remove permissões anteriormente concedidas.
#
# Forma geral:
#
# GRANT privilegios ON objeto TO 'usuario';
# REVOKE privilegios ON objeto FROM 'usuario';


# ------------------------------------------------------------
# 3. CONCEDENDO E REVOGANDO SELECT
# ------------------------------------------------------------

# Concede ao usuário carter permissão de leitura sobre a tabela
# analysis do banco rideshare.

GRANT SELECT ON `rideshare`.`analysis` TO 'carter';

# Remove a permissão de leitura concedida acima.

REVOKE SELECT ON `rideshare`.`analysis` FROM 'carter';


# ------------------------------------------------------------
# 4. PERMISSÕES GLOBAIS
# ------------------------------------------------------------

# *.* representa todos os bancos e todas as tabelas.
#
# GRANT ALL concede todas as permissões disponíveis e aplicáveis
# ao escopo indicado.
#
# REVOKE ALL remove as permissões concedidas nesse escopo,
# mas não deve ser entendido como uma garantia de remoção de
# toda e qualquer permissão que o usuário possa possuir.
#
# Atenção: permissões globais amplas devem ser evitadas em
# aplicações reais, seguindo o princípio do menor privilégio.

GRANT ALL ON *.* TO 'carter';

REVOKE ALL ON *.* FROM 'carter';


# ------------------------------------------------------------
# 5. PRINCÍPIO DO MENOR PRIVILÉGIO
# ------------------------------------------------------------

# Conceda somente as permissões necessárias para cada usuário.
#
# Exemplo:
# - Um usuário que apenas consulta relatórios pode precisar
#   somente de SELECT.
# - Um usuário que insere dados pode precisar de INSERT.
# - Permissões administrativas devem ser restritas.