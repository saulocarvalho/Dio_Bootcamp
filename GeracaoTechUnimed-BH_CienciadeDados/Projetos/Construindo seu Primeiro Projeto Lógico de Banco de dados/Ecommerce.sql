#Criação do BD para o cenário de E-commerce

create database ecommerce;
use ecommerce;

create table cliente(
		idCliente int auto_increment primary key,
        Pnome varchar(10) not null,
        Sobrenome varchar(30),
        Endereco varchar(45),
        DataNascimento date not null,
        CPF char(11) not null,
        Email varchar(30),
        Celular char(11),
        constraint unique_cpf_cliente unique (CPF),
        constraint unique_email_cliente unique (Email),
        constraint unique_celular_cliente unique (Celular)
);

create table produto(
		idProduto int auto_increment primary key,
        ProdutoNome varchar(20) not null,
        ClassificadoCriancas bool default false,
        Categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
        Avaliacao float,
        dimencao varchar(10)
);

create table pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        PedidoStatus enum ('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        Descricao varchar(255),
        Frete float,
        constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente)
);

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
        constraint fk_pagamento_pedido foreign key (idPedidoPagamento) references pedido(idPagamento)
);

create table estoque(
		idEstoque int auto_increment primary key,
        Localidade varchar(255) not null,
        Quantidade int not null
);

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

create table produtoVendedor(
		idProdutoVendedor int,
        idProduto int,
        Quantidade int not null,
        primary key (idProdutoVendedor, idProduto),
        constraint fk_produto_vendedor foreign key (idProdutoVendedor) references vendedor(idVendedor),
        constraint fk_produto_produto foreign key (idProduto) references produto(idProduto)
);