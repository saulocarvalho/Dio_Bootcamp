-- Criação do BD para cenário de E-commerce
-- Incompleto



create database ecommerce;
use ecommerce;
-- drop database ecommerce;
-- Criar tabela cliente
create table clients(
	idClient INT auto_increment primary key,
    Fname varchar(10) not null,
    Minit char(3),
    Lname varchar(20),
    Cpf char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (Cpf)
);
alter table clients auto_increment=1;

create table product(
	idProduct INT auto_increment primary key,
    Pname varchar(10) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') not null,
	Avaliação float default 0,
    size varchar(10)
);
alter table product auto_increment=1;
-- Para continuar... Implementar a tabela e criar uma conexão as tabelas necessárias
-- E refletir as modificações no diagrama de esquema relacional
create table payments(
	idPayment int,
    idClient int,
    typePayment enum('Boleto', 'Cartão','Dois cartões'),
    limitAvaible float,
    primary key(idClient, idPayment)
);

-- constraint fk_payment foreign key (idPpayment) references payments(idPayment),
create table orders(
	idOrder INT auto_increment primary key,
    idOrderClient int, 
    OrderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    OrderDescription varchar(255),
    Shipping float default 10,  
    PaymentCash bool default false,
    idPpPayment int,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);
alter table orders auto_increment=1;
-- alter table orders
-- add constraint fk_payment foreign key (idPpPayment) references payments(idPayment);
create table productstorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(30) not null,
    Quantity int default 0
);


create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_socialName_Supplier unique (socialName),
    constraint unique_CNPJ_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;

create table Seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15),
    CPF char(9),
    Location varchar(255) not null,
    Contact char(11) not null,
    constraint unique_Socialname_Seller unique (socialName),
    constraint unique_CNPJ_Seller unique (CNPJ),
    constraint unique_CPF_Seller unique (CPF)
);
alter table Seller auto_increment=1;
create table productSeller(
	idPseller int,
    idPProduct int,
    ProdQuantity int not null default 1,
    primary key (idPseller, idPproduct),
	constraint fk_produc_seller foreign key (idPseller) references Seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references Product(idProduct)
);


create table productOrder(
	idPOproduct int,
    idPOorder int,
    ProdQuantity int not null default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPoproduct, idPOorder),
	constraint fk_product_product_productorder foreign key (idPOproduct) references Product(idProduct),
    constraint fk_produc_order foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    Location varchar(255) not null,
    primary key (idLproduct, idLstorage),
	constraint fk_produc_storageLocation foreign key (idLstorage) references productStorage(idProdStorage),
    constraint fk_product_product_storage foreign key (idLProduct) references Product(idProduct)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
	constraint fk_produc_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references Product(idProduct)
);

use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

use ecommerce;
show tables