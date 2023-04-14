#Criação do BD para o cenário de E-commerce
#drop database ecommerce;
create database ecommerce;
use ecommerce;

create table cliente(
		idCliente int auto_increment primary key,
        Pnome varchar(10) not null,
        Sobrenome varchar(30),
        Endereco varchar(255),
        DataNascimento date not null,
        CPF char(11) not null,
        Email varchar(30),
        Celular char(11),
        constraint unique_cpf_cliente unique (CPF),
        constraint unique_email_cliente unique (Email),
        constraint unique_celular_cliente unique (Celular)
);
alter table cliente auto_increment = 1;
create table produto(
		idProduto int auto_increment primary key,
        ProdutoNome varchar(50) not null,
        ClassificadoCriancas bool default false,
        Categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
        Descricao varchar(255),
        Avaliacao float,
        dimencao varchar(10)
);
alter table produto auto_increment = 1;
#alter table produto modify ProdutoNome varchar(50);
create table pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        PedidoStatus enum ('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        Descricao varchar(255),
        Frete float,
        constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente)
);
desc pedido;
create table pagamento(
		idCliente int,
        idPagamento int,
        idPedidoPagamento int,
        TipodePagamento enum('Cartão de crédito', 'Cartão de débito', 'Boleto', 'Dinheiro', 'PIX'),
        CartaoNumero char(16),
        CartaoValidade char(5),
        CartaoCVV char(3),
        ValorTotal float, 
        primary key (idCliente, idPagamento),
        constraint fk_pagamento_pedido foreign key (idPedidoPagamento) references pedido(idPedido)
);

create table estoque(
		idEstoque int auto_increment primary key,
        Localizacao varchar(255) not null,
        Quantidade int not null
);
alter table estoque auto_increment = 1;
create table fornecedor(
		idFornecedor int auto_increment primary key,
        CNPJ char(15) not null,
        RazaoSocial varchar(45) not null,
        NomeFantasia varchar(45),
        Endereco varchar (255) not null,
        Contato varchar(11) not null,
        constraint unique_cnpj_fornecedor unique (CNPJ),
        constraint unique_razaosocial_fornecedor unique (RazaoSocial)
);
alter table fornecedor auto_increment = 1;
create table vendedor(
		idVendedor int auto_increment primary key,
        CNPJ char(15),
        CPF char(11),
        RazaoSocial varchar(45),
        NomeFantasia varchar(45),
        Nome varchar (10),
        Sobrenome varchar (30),
        Endereco varchar (255) not null,
        Contato varchar(11) not null,
        constraint unique_cnpj_vendedor unique (CNPJ),
        constraint unique_cpf_vendedor unique (CPF),
        constraint unique_razaosocial_vendedor unique (RazaoSocial)
);
alter table vendedor auto_increment = 1;
desc vendedor;
create table produtoVendedor(
		idProdutoVendedor int,
        idProduto int,
        Quantidade int not null,
        primary key (idProdutoVendedor, idProduto),
        constraint fk_produto_vendedor foreign key (idProdutoVendedor) references vendedor(idVendedor),
        constraint fk_produto_produto foreign key (idProduto) references produto(idProduto)
);
desc produtoVendedor;
create table produtoPedido(
		idProdutoProduto int,
        idProdutoPedido int,
        ProdutoQuantidade int default 1,
        ProdutoPedidoStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idProdutoProduto, idProdutoPedido),
        constraint fk_produto_pedido foreign key (idProdutoProduto) references produto(idProduto),
        constraint fk_pedido_pedido foreign key (idProdutoPedido) references  pedido(idPedido)
);

create table estoqueLocalizacao(
		idLproduto int,
        idLestoque int ,
        localizacao varchar (255) not null,
        primary key (idLproduto, idLestoque),
        constraint fk_estoqueLocalizacao_produto foreign key (idLproduto) references produto(idProduto),
        constraint fk_estoqueLocalizacao_estoque foreign key (idLestoque) references  estoque(idEstoque)
);

create table produtoFornecedor(
		idPsFornecedor int,
        idpsProduto int,
        quantidade int not null,
        primary key (idPsFornecedor, idPsProduto),
        constraint fk_produtoFornecedor_fornecedor foreign key(idPsFornecedor) references fornecedor(idFornecedor),
        constraint fk_produtoFornecedor_produto foreign key(idPsProduto) references produto(idProduto)
);
show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce'