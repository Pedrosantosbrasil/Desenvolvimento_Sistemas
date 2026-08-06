Atividade Prática - Sistema FoodFlex (Gestão de Restaurante)

1. Escopo do Problema e Estrutura de Dados: Para o sistema FoodFlex, mapeamos a entidade Prato com os atributos necessários para a gestão do cardápio: id (chave primária interna), nome, preco e categoria do item.

2. Resumo das Operações CRUD Implementadas:

Create (Inserir): Executado via método inserirPrato(Prato), permitindo adicionar novos itens ao cardápio local do restaurante.

Read (Ler): Mapeado pelas consultas obterTodosPratos() para listagem geral do menu e buscarPorCategoria(String) para filtros na interface.

Update (Atualizar): Modifica o preço, nome ou categoria de um item existente através do método atualizarPrato(Prato).

Delete (Remover): Exclui permanentemente um item do menu utilizando o método removerPrato(Prato).

3. Justificativa Técnica: A utilização do Room em detrimento de arquivos de texto plano garante que as atualizações de preço e buscas por categoria sejam feitas de forma segura, performática e livre de inconsistências de dados em caso de fechamento inesperado do aplicativo no ambiente operacional do restaurante.