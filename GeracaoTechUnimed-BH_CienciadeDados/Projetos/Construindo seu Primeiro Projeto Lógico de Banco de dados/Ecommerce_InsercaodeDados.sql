use ecommerce;


insert into cliente (Pnome, Sobrenome, CPF, Endereco, DataNascimento, Email, Celular) 
	   values('Maria','M Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores', '2000-07-05', 'maria@msilva.com.br', 82987417417),
		     ('Matheus','O Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores', '1990-04-04', 'matheus@opimentel.com.br', 77945214741),
			 ('Ricardo','F Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores', '1995-10-25', 'ricardo@fsilva.com.br', 11947581354),
			 ('Julia','S França', 789123456,'rua lareijras 861, Centro - Cidade das flores', '2001-01-25', 'julia@ffranca.com.br', 31945789652),
			 ('Roberta','G Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores', '1999-03-01', 'roberta@gassis.com.br', 81987432568),
			 ('Isabela','M Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores', '1995-05-20', 'isabela@mcruz.com.br', 11998547567);
             
insert into produto (ProdutoNome, ClassificadoCriancas, Categoria, avaliacao, dimencao) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);
         
#delete from pedido where idPedido in (9,10,11,12,13,14,15,16);         
insert into pedido (idPedidoCliente, PedidoStatus, Descricao, Frete) values 
							 (1, default,'compra via aplicativo',null),
                             (2, default,'compra via aplicativo',50),
                             (3, 'Confirmado',null,null),
                             (4, default,'compra via web site',150);
select * from pedido;
insert into produtoPedido (idProdutoProduto, idProdutoPedido, ProdutoQuantidade, ProdutoPedidoStatus) values
						 (1,1,2,default),
                         (2,1,1,default),
                         (3,2,1,default);
                         
						
insert into estoque (Localizacao,Quantidade) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
                            
insert into estoqueProduto (idLproduto, idLestoque,localizacao) values
						 (1,2,'RJ'),
                         (2,6,'GO');
                         
insert into fornecedor (RazaoSocial, CNPJ, Contato, NomeFantasia, Endereco) values 
							('Almeida e filhos', 123456789123456,'21985474', 'Marquinhos construções','Rua Americo Vasco, 215 - PE'),
                            ('Eletrônicos Silva',854519649143457,'21985484', 'Flavinho do eletrônico', 'Rua Trindade, 578 - AL'),
                            ('Eletrônicos Valma', 934567893934695,'21975474', 'Emanuelsonzin eletro', 'Rua tambaú, 2878 - PB');                
                          
insert into produtoFornecedor (idPsFornecedor, idpsProduto, Quantidade) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);
                         
insert into vendedor (RazaoSocial, NomeFantasia, CNPJ, CPF, Endereco, Contato, Nome, Sobrenome) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287, null, null),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895, 'Emanuel', 'M Carvalho'),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484, null, null);
select * from vendedor;

insert into produtoVendedor (idProdutoVendedor, idProduto, Quantidade) values 
						 (1,6,80),
                         (2,7,10);
                         
select * from cliente;

#Numero de clientes que tenho
select count(*) from cliente;

select concat (PNome, ' ',Sobrenome) as NomeCompleto, idPedido, PedidoStatus
			from cliente c, pedido p where c.idcliente = idPedidoCliente;
            
insert into pedido (idPedidoCliente, PedidoStatus, Descricao, Frete) values 
			(2, default, 'Compra via Aplicativo', null);
