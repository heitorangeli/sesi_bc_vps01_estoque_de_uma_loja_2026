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

## Arquivos CSV:
[produtos.csv](fornecedor.csv)<br>
[fornecedor.csv](./fornecedor.csv)<br>
[categoria.csv](./categoria.csv)<br>
[produtos.csv](./produtos.csv)<br>
[estoque.csv](./estoque.csv)<br>

## Scripts:
DDL:
```SQL
drop database if exists gestao_roupas;
create database gestao_roupas;
use gestao_roupas;

create table fornecedor (
    id int not null primary key auto_increment,
    razao_social varchar(100) not null,
    nome_fantasia varchar(150) not null,
    cnpj varchar(18) not null,
    telefone varchar(20) not null,
    email varchar(100) not null,
    endereco varchar(100) not null
);

create table categoria (
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    descricao varchar(100)
);

create table produtos (
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    quantidade int not null,
    marca varchar(100) not null,
    id_fornecedor int not null,
    id_categoria int not null
);

create table estoque (
    id_estoque int not null primary key auto_increment,
    id_produto int not null,
    quantidade int not null,
    quantidade_minima int not null
);

create table movimentacao (
    id_movimentacao int not null primary key auto_increment,
    id_produto int not null,
    tipo enum('Entrada', 'Saída') not null,
    quantidade int not null,
    data DATE not null default(CURDATE())
);



alter table produtos add constraint fk_produtos_fornecedor foreign key (id_fornecedor) references fornecedor(id);
alter table produtos add constraint fk_produtos_categoria foreign key (id_categoria) references categoria(id);
alter table estoque add constraint fk_estoque_produtos foreign key (id_produto) references produtos(id);
alter table movimentacao add constraint fk_movimentacao_produtos foreign key (id_produto) references produtos(id);

describe fornecedor;
describe categoria;
describe produtos;
describe estoque;
describe movimentacao;
show tables;
```
DML:
```SQL
use gestao_roupas;

insert into fornecedor (razao_social, nome_fantasia, cnpj, telefone, email, endereco) values
("Loja boa LTDA", "Loja boa", "1234567890123", "10123456789", "lojaboa@gmail.com", "Rua A 1"),
("Loja bacana LTDA", "Loja bacana", "12345678901234", "10222222222", "lojabacana@gmail.com", "Rua B 2"),
("Loja barata LTDA", "Loja barata", "123456789012345", "10333333333", "lojabarata@gmail.com", "Rua C 3");

insert into categoria (nome, descricao) values
("Camisas", "Camisas verdejantes"),
("Calcas", "Calcas pomposas"),
("Meias", "Meias radiantes");

insert into produtos (nome, preco, quantidade, marca, id_fornecedor, id_categoria) values
("Camisa Azul", 50.00, 10, "Marca amigável", 1, 1),
("Calca verde vômito", 100.00, 5, "Marca boa", 2, 2),
("Meia laranja", 10.00, 50, "Marca criativa", 3, 3);

insert into estoque (id_produto, quantidade, quantidade_minima) values
(1, 10, 2),
(2, 5, 1),
(3, 50, 10);

insert into movimentacao (id_produto, tipo, quantidade, data) values
(1, "Entrada", 1, "2026-09-01 10:55:55"),
(2, "Saída", 2, "2026-09-02 14:30:30"),
(3, "Entrada", 3, "2026-09-03 09:15:15");


select * from fornecedor;
select * from categoria;
select * from produtos;
select * from estoque;
select * from movimentacao;
```
