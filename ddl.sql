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



alter table produtos add constraint fk_fornece foreign key (id_fornecedor) references fornecedor(id);
alter table produtos add constraint fk_possui foreign key (id_categoria) references categoria(id);
alter table estoque add constraint fk_esta_no foreign key (id_produto) references produtos(id);
alter table movimentacao add constraint fk_movimentado foreign key (id_produto) references produtos(id);

describe fornecedor;
describe categoria;
describe produtos;
describe estoque;
describe movimentacao;
show tables;