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
(1, "Entrada", 1, "2026-09-01"),
(2, "Saída", 2, "2026-09-02"),
(3, "Entrada", 3, "2026-09-03");


select * from fornecedor;
select * from categoria;
select * from produtos;
select * from estoque;
select * from movimentacao;