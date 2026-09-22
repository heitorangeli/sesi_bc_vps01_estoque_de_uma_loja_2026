# Primeira avaliação da matéria Banco de Dados
## Dicionário de Dados

| Entidade | Atributo | Tipo | Tamanho | Descrição |
|---|---|---|---|---|
| Fornecedor | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Fornecedor | razao_social | Texto | 100 | Razão social do fornecedor |
| Fornecedor | email | Texto | 100 | E-mail do fornecedor |
| Fornecedor | endereco | Texto | 100 | Endereço completo do fornecedor |
| Fornecedor | cnpj | Texto | 18 | CNPJ do fornecedor |
| Fornecedor | nome_fantasia | Texto | 150 | Nome fantasia do fornecedor |
| Fornecedor | telefone | Texto | 20 | Telefone do fornecedor |
| Categoria | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Categoria | nome | Texto | 100 | Nome da categoria |
| Categoria | descricao | Texto | 100 | Descrição da categoria |
| Produtos | id | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Produtos | id_fornecedor | Inteiro | 11 | Identificador do fornecedor, FK referenciando Fornecedor (id) |
| Produtos | id_categoria | Inteiro | 11 | Identificador da categoria, FK referenciando Categoria (id) |
| Produtos | nome | Texto | 100 | Nome do produto |
| Produtos | preco | Decimal | 10,2 | Preço do produto |
| Produtos | quantidade | Inteiro | 11 | Quantidade do produto |
| Produtos | marca | Texto | 100 | Marca do produto |
| Estoque | id_estoque | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Estoque | id_produto | Inteiro | 11 | Identificador do produto, FK referenciando Produtos (id) |
| Estoque | quantidade | Inteiro | 11 | Quantidade em estoque |
| Estoque | quantidade_minima | Inteiro | 11 | Quantidade mínima para controle de estoque |
| Movimentacao de equipe | id_movimentacao | Inteiro | 11 | Identificador, PK, Auto incrementável |
| Movimentacao de equipe | id_produto | Inteiro | 11 | Identificador do produto, FK referenciando Produtos (id) |
| Movimentacao de equipe | quantidade | Inteiro | 11 | Quantidade movimentada |
| Movimentacao de equipe | tipo | Texto | 10 | Tipo de movimentação (Entrada, Saída) |
| Movimentacao de equipe | data | Data | - | Data e hora da movimentação |

## MER e DER:
- Conceitual:
![a](/md_conceitual.png)
- Lógico:
  <br>
![b](/md_logico.png)
