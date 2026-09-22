drop database if exists gestao_pedidos;
create database gestao_pedidos;
use gestao_pedidos;
create table produtos(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    quantidade int not null,
    marca text(100),
    id_fornecedor int not null,
    id_categoria int not null,
);
create table telefone(
    id int not null primary key auto_increment,
    id_cliente int not null,
    numero varchar(100) not null unique,
    tipo enum('Residencial', 'Comercial', 'Celular') not null
);
create table fornecedor(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    cnpj texto(11) not null,
    numero varchar(10),
    complemento varchar(100)
);
create table pedido(
    id int not null primary key auto_increment,
    id_cliente int not null,
    id_produto int not null,
    quantidade int not null,
    valor_unitario decimal(10,2) not null,
    subtotal decimal(10,2) default (valor_unitario * quantidade)
);

alter table telefone add constraint fk_telefones foreign key (id_cliente) references cliente(id);
alter table pedido add constraint fk_faz foreign key (id_cliente) references cliente(id);
alter table pedido add constraint fk_possui foreign key (id_produto) references produto(id);

describe produto;
describe telefone;
describe cliente;
describe pedido;
show tables;