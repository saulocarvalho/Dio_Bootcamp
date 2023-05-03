#Criação do BD oficina
show databases;
create database oficina;

use oficina;
create table Cliente(
idCliente int auto_increment primary key,
Cliente_CPF char(11) not null,
Cliente_Nome varchar(10) not null,
Cliente_Sobrenome varchar(25) not null,
Cliente_DataNascimento date not null,
cliente_Email varchar(30) not null,
Cliente_Celular char (11),
Cliente_CEP char(8) not null,
Cliente_Logradouro varchar (45) not null,
Cliente_Numero varchar (5),
Cliente_Complemento varchar (20),
Cliente_Bairro varchar (15) not null,
Cliente_Municipio varchar(20) not null,
Cliente_UF char(2) not null,
constraint unique_CPF_ClienteCPF unique (Cliente_CPF),
constraint unique_Email_ClienteEmail unique (Cliente_Email),
constraint unique_Celular_ClienteCeuluar unique (Cliente_Celular)
);
alter table Cliente auto_increment = 1;

create table Veiculo (
idVeiculo int auto_increment primary key,
Cliente_idCliente int,
Veiculo_Placa char(7) not null,
Veiculo_Marca varchar (30) not null,
Veiculo_Modelo varchar(70) not null,
Veiculo_Ano year not null ,
Veiculo_Cor varchar(15) not null,
Veiculo_Renavam char(11) not null,
constraint fk_ClienteidCliente_idCliente foreign key (Cliente_idCliente) references Cliente(idCliente),
constraint unique_placa_VeiculoPlaca unique (Veiculo_Placa),
constraint unique_chassi_VeiculoRenavam unique (Veiculo_Renavam)
);
alter table Veiculo auto_increment = 1;

create table Orcamento(
idOrcamento int auto_increment primary key,
Orcamento_Descricao varchar (255) not null,
Orcamento_TipoServico varchar (45) not null,
Orcamento_Data date not null,
Orcamento_Valor float not null
);
alter table Orcamento auto_increment = 1;

create table Mecanico(
idMecanico int auto_increment primary key,
Mecanico_Matricula char(7) not null,
Mecanico_Nome varchar(50) not null,
Mecanico_CPF char (11) not null ,
Mecanico_Especialidade varchar(45),
constraint unique_Matricula_MecanicoMatricula unique (Mecanico_Matricula),
constraint unique_CPF_MecanicoCPF unique (Mecanico_CPF)
);
alter table Mecanico auto_increment = 1;

create table OrdemServico(
idOrdemServico int auto_increment primary key,
OS_Protocolo char(8) not null,
OS_DataEmissao date not null,
OS_DataConclusao date not null,
OS_ValorTotal float not null,
OS_Garantia date not null,
constraint unique_protocolo_OSProtocolo unique (OS_Protocolo)
);
alter table OrdemServico auto_increment = 1;

create table Produto(
idProduto int auto_increment primary key,
Produto_Descricao varchar(255) not null,
Produto_Valor float not null
);
alter table Produto auto_increment = 1;

create table OrcamentoVeiculo(
Orcamento_idOrcamento int,
Cliente_idCliente int,
Veiculo_idVeiculo int,
OrcamentoVeiculo_DataPrevistaEntrega date not null,
primary key (Orcamento_idOrcamento,Cliente_idCliente),
constraint fk_OrcamentoVeiculoidVeiculo_idVeiculo foreign key (Veiculo_idVeiculo) references Veiculo(idVeiculo),
constraint fk_OrcamentoidCliente_idCliente foreign key (Cliente_idCliente) references Cliente(idCliente),
constraint fk_OrcamentoidOrcamento_idOrcamento foreign key (Orcamento_idOrcamento) references Orcamento(idOrcamento)
);

create table OrcamentoMecanico(
Orcamento_idOrcamento int,
Mecanico_idMecanico int,
OrcamentoMecanico_ValorMecanico float not null,
primary key (Orcamento_idOrcamento, Mecanico_idMecanico),
constraint fk_OMOrcamentoidCorcamento_idOrcamento foreign key (Orcamento_idOrcamento) references Orcamento(idOrcamento),
constraint fk_MecanicoidMecanico_idMecanico foreign key (Mecanico_idMecanico) references Mecanico(idMecanico)
);

create table OSOrcamento(
OS_idOrdemServico int,
Orcamento_idOrcamento int,
OSOrcamento_valor float not null,
primary key (OS_idOrdemServico, Orcamento_idOrcamento),
constraint fk_OSidOrdemServico_idOrdemServico foreign key (OS_idOrdemServico) references OrdemServico(idOrdemServico),
constraint fk_OSOOrcamento_idOrcamento foreign key (Orcamento_idOrcamento) references Orcamento(idOrcamento)
);

create table OSMecanico(
OS_idOrdemServico int,
Mecanico_idMecanico int,
OSMecanico_MaoDeObra float not null,
primary key (OS_idOrdemServico, Mecanico_idMecanico),
constraint fk_OSMidOrdemServico_idOrdemServico foreign key (OS_idOrdemServico) references OrdemServico(idOrdemServico),
constraint fk_OSMecanicoidMecanico_idMecanico foreign key (Mecanico_idMecanico) references Mecanico(idMecanico)
);

create table OSProduto(
OS_idOrdemServico int,
Produto_idProduto int,
OSProduto_Quantidade int,
primary key (OS_idOrdemServico, Produto_idProduto),
constraint fk_OSPidOrdemServico_idOrdemServico foreign key (OS_idOrdemServico) references OrdemServico(idOrdemServico),
constraint fk_ProdutoidProduto_idProduto foreign key (Produto_idProduto) references produto(idProduto)
);