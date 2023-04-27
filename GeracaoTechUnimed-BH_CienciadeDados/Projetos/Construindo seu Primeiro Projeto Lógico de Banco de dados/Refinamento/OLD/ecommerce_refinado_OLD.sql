#Criação database ecommerce_refinado
#drop database ecommerce_refinado;
#create database ecommerce_refinado_OLD;
use ecommerce_refinado_OLD;
show tables;
create table Cliente(
idCliente int auto_increment primary key,
cliente_Email varchar(30) not null,
Cliente_Celular char (11),
Cliente_Telefone char (10),
Cliente_CEP char(8) not null,
Cliente_Logradouro varchar (45) not null,
Cliente_Numero varchar (5),
Cliente_Complemento varchar (20),
Cliente_Bairro varchar (15) not null,
Cliente_Municipio varchar(20) not null,
Cliente_UF char(2) not null,
constraint unique_email_cliente unique (Cliente_Email),
constraint unique_celular_cliente unique (Cliente_Celular),
constraint unique_telefone_cliente unique (Cliente_Telefone)
);

create table ClientePF(
idClientePF int auto_increment primary key,
Cliente_idCliente int,
ClientePF_CPF char(11) not null,
ClientePF_Nome varchar(10) not null,
ClientePF_Sobrenome varchar(25) not null,
ClientePF_DataNascimento date not null,
constraint fk_Cliente_ClientePF foreign key (Cliente_idCliente) references Cliente(idCliente),
constraint unique_CPF_ClientePF unique (ClientePF_CPF)
);

create table ClientePJ(
idClientePJ int auto_increment primary key,
Cliente_idCliente int,
ClientePJ_CNPJ char(15) not null,
ClientePJ_RazaoSocial varchar(30) not null,
ClientePJ_NomeFantasia varchar(30) not null,
constraint fk_Cliente_ClientePJ foreign key (Cliente_idCliente) references Cliente(idCliente),
constraint unique_CNPJ_ClientePJ unique (ClientePJ_CNPJ),
constraint unique_RazaoSocial_ClientePJ unique (ClientePJ_RazaoSocial)
);

create table Produto(
idProduto int auto_increment primary key,
Produto_Nome varchar (45) not null,
Produto_Categoria ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
Produto_Descricao varchar(255),
Produto_Marca varchar (20) not null,
Produto_Modelo varchar(20) not null,
Produto_Avaliacao float,
Produto_Valor float not null
);

create table Pedido(
idPedido int auto_increment primary key,
ClientePF_idClientePF int,
ClientePJ_idClientePJ int,
Pedido_Status ENUM('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento' not null,
Pedido_Descricao varchar(255),
Pedido_CodRastreamento int,
Pedido_ValorFrete float,
constraint fk_idClientePF_ClientePF foreign key (ClientePF_idClientePF) references ClientePF(idClientePF),
constraint fk_idClientePJ_ClientePJ foreign key (ClientePJ_idClientePJ) references ClientePJ(idClientePJ)
);

create table Pagamento(
idPagamento int,
Cliente_idClientePF int,
Cliente_idClientePJ int,
Pedido_idPedido int,
Pagamento_TipoPagamento ENUM('Cartão de crédito', 'Cartão de Débito', 'PIX', 'Dinheiro') not null,
Pagamento_CartaoNumero char(12),
Pagamento_CartaoValidade char(6),
Pagamento_CartaoCVV char(3),
Pagamento_ValorTotal float,
primary key (idPagamento, Cliente_idClientePF, Cliente_idClientePJ),
constraint fk_idPedido_Pedido foreign key (Pedido_idPedido) references Pedido(idPedido)
);

create table Estoque(
idEstoque int auto_increment primary key,
Estoque_Localizacao varchar(45) not null,
Estoque_Quantidade varchar(45) not null
);

create table Fornecedor(
idFornecedor int auto_increment primary key,
Fornecedor_CNPJ char(14) not null,
Fornecedor_RazaoSocial varchar(30) not null,
Fornecedor_NomeFantasia varchar(30) not null,
Fornecedor_Email varchar(30) not null,
Fornecedor_Celular char(11), 
Fornecedor_Telefone char(10),
Fornecedor_CEP char(8) not null,
Fornecedor_Logradouro varchar(45) not null,
Fornecedor_Numero varchar(5),
Fornecedor_Complemento varchar(20),
Fornecedor_Bairro varchar(15) not null,
Fornecedor_Municipio varchar(30) not null,
Fornecedor_UF char(2) not null,
constraint unique_CNPJ_Fornecedor unique (Fornecedor_CNPJ), 
constraint unique_RazaoSocial_Fornecedor unique (Fornecedor_RazaoSocial),
constraint unique_Email_Fornecedor unique (Fornecedor_Email),
constraint unique_Celular_Fornecedor unique (Fornecedor_Celular),
constraint unique_Telefone_Fornecedor unique (Fornecedor_Telefone)
);

create table Vendedor(
idVendedor int auto_increment primary key,
Vendedor_CNPJ char(14) not null,
Vendedor_RazaoSocial varchar(30) not null,
Vendedor_NomeFantasia varchar(30) not null,
Vendedor_Email varchar(30) not null,
Vendedor_Celular char(11), 
Vendedor_Telefone char(10),
Vendedor_CEP char(8) not null,
Vendedor_Logradouro varchar(45) not null,
Vendedor_Numero varchar(5),
Vendedor_Complemento varchar(20),
Vendedor_Bairro varchar(15) not null,
Vendedor_Municipio varchar(30) not null,
Vendedor_UF char(2) not null,
constraint unique_CNPJ_Vendedor unique (Vendedor_CNPJ), 
constraint unique_RazaoSocial_Vendedor unique (Vendedor_RazaoSocial),
constraint unique_Email_Vendedor unique (Vendedor_Email),
constraint unique_Celular_Vendedor unique (Vendedor_Celular),
constraint unique_Telefone_Vendedor unique (Vendedor_Telefone)
);

create table VendedorProduto(
Vendedor_idVendedor int, 
Produto_idProduto int,
VendendorProduto_Quantidade int not null,
primary key (Vendedor_idVendedor, Produto_idProduto),
constraint fk_idVendedor_Vendedor foreign key (Vendedor_idVendedor) references Vendedor(idVendedor),
constraint fk_idProduto_Produto foreign key (Produto_idProduto) references Produto(idProduto)
);

create table FornecedorProduto(
Fornecedor_idFornecedor int,
Produto_idProduto int,
FornecedorProduto_Quantidade int not null,
primary key (Fornecedor_idFornecedor, Produto_idProduto),
constraint fk_idFornecedor_Fornecedor foreign key (Fornecedor_idFornecedor) references Fornecedor(idFornecedor),
constraint fk_idFornecedorProduto_Produto foreign key (Produto_idProduto) references Produto(idProduto)
);

create table PedidoProduto(
Pedido_idPedido int,
Produto_idProduto int,
PedidoProduto_Quantidade int not null,
PedidoProduto_Status ENUM('Disponível', 'Sem estoque') not null default 'Disponível',
PedidoProduto_DataPedido date not null,
primary key (Pedido_idPedido, Produto_idProduto),
constraint fk_idPedidoProduto_Pedido foreign key (Pedido_idPedido) references Pedido(idPedido),
constraint fk_idPedidoProduto_Produto foreign key (Produto_idProduto) references Produto (idProduto)
);

create table EstoqueProduto(
Estoque_idEstoque int,
Produto_idProduto int,
EstoqueProduto_UF char(2),
primary key (Estoque_idEstoque, Produto_idProduto),
constraint fk_idEstoqueProduto_Estoque foreign key (Estoque_idEstoque) references Estoque (idEstoque),
constraint fk_idEstoqueProduto_Produto foreign key (Produto_idProduto) references Produto(idProduto)
);
