use ecommerce_refinado_teste;



insert into clientePF (ClientePF_CPF, ClientePF_Nome, ClientePF_Sobrenome, ClientePF_DataNascimento) 


	   values(12346789421, 'Emanuel', 'M Carvalho', '2002-07-05'),
			(65487465254, 'Saulo', 'D Carvalho', '2000-12-02'),
            (12332125125, 'Jorge', 'T Garlhado', '1997-05-13'),
            (22664456504, 'Ryan', 'F Vilar', '1973-03-24');
            

select * from clientepf;

insert into Cliente (Cliente_idClientePF, cliente_Email, Cliente_Celular, Cliente_Telefone, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF)
			values('1','Emano@emmc.com.br', 83987417417, null, 57025458, 'rua silva de prata', 29, null, 'Carangola', 'Cidade das flores', 'PB'),
					('2', 'saulo@sdc.com.br', 82965452154, 8233554411, 88047596, 'Rua Manoel Soares DAzevedo Maia', 255, null, 'Carianos', 'Maceió', 'AL'),
                    ('3', 'jorge@jtg.com.br', null, 6838485483, 69919817, 'Rua N2', 02, null, 'Conjunto Tucumã', 'Rio Branco', 'AC'),
                    ('4', 'ryan.vilar@geradornv.com.br',71993683614, 7133230670, 41950690, 'Travessa Professora Nilzete', 54, null, 'Rio Vermelho', 'Salvador', 'BA');

select * from Cliente;



select  * from  cliente join ClientePF
			where idCliente = Cliente_idClientePF;

insert into produto (Produto_Nome, Produto_Categoria, Produto_Descricao, Produto_Marca, Produto_Modelo, Produto_Avaliacao, Produto_Valor) values
							  ('Notebook Dell Vostro 3510','Eletrônico','Notebook de alto desempenho para uso diário...','Dell', 'Vostro 3510', 4.8, 3500);
                              
                              
select * from Produto;

insert into pedido (Cliente_idCliente, Pedido_Status, Pedido_Descricao, Pedido_CodRastreamento, Pedido_ValorFrete) values 
							 (1, default,'Compra via App',25648, 150);
                             
select * from cliente, ClientePF inner join pedido where idCliente = Cliente_idCliente;


insert into PedidoProduto (Pedido_idPedido, Produto_idProduto, PedidoProduto_Quantidade, PedidoProduto_Status, PedidoProduto_DataPedido) values
						 (1,1,1,default, '2023-04-20');
                         
                         
select * from ClientePF inner join PedidoProduto on idClientePF = Pedido_idPedido
							inner join produto on idProduto = Pedido_idPedido;

insert into Pagamento (Cliente_idClientePF, Cliente_idClientePJ, Pedido_idPedido, Pagamento_TipoPagamento, Pagamento_CartaoNumero, Pagamento_CartaoValidade, Pagamento_CartaoCVV, Pagamento_ValorTotal) values
						(1, null, 1, 'Cartão de crédito', 123456789102, 072027, 666, 3650);
                        
select * from ClientePF inner join PedidoProduto as pp on idClientePF = pp.Pedido_idPedido
						inner join produto on idProduto = Pedido_idPedido
                        inner join Pagamento as pa on pp.Pedido_idPedido = pa.Pedido_idPedido; 
                        
insert into estoque (Estoque_Localizacao,Estoque_Quantidade) values 
							('Maceió',1000),
                            ('João Pessoa',500),
                            ('Belo Horizonte',10),
                            ('Manaus',100),
                            ('São Paulo',10),
                            ('Brasília',60);  
         select * from estoqueProduto inner join estoque on Estoque_idEstoque = idEstoque;                   
insert into estoqueProduto (Estoque_idEstoque, Produto_idProduto,EstoqueProduto_UF) values
						 (1,1,'AL'),
                         (6,1,'DF');
                         
insert into fornecedor (Fornecedor_RazaoSocial, Fornecedor_CNPJ, Fornecedor_NomeFantasia, Fornecedor_Email, Fornecedor_Celular,
						Fornecedor_Telefone, Fornecedor_CEP, Fornecedor_Logradouro, Fornecedor_Numero, Fornecedor_Complemento, Fornecedor_Bairro,
                        Fornecedor_Municipio, Fornecedor_UF) values 
							('Almeida e filhos', 12345678912345,'Marquinhos construções', 'marquinhos@marquinhos.com.br',
                            77955442232, 7733150121, 57435214, 'Rua abcs', 542, null, 'desconhecidos', 'Salvador', 'BH'),
                            ('Eletrônicos Silva',85419649143457,'Flavinho do eletrônico', 'flavinho@flavio.com.br',null,6133998424,
                            47895324, 'Rua Trindade', 578, null, 'Asa Norte', 'Ceilândia', 'DF'),
                            ('Eletrônicos Emanoshow', 93456789934695,'Emanuelsonzin eletro', 'emanuelson@sonzin.com.br', 
                            83955554433, null, 69852457, 'Rua Ketchup', 2878, null, 'Tambaú', 'João Pessoa', 'PB');   
                            
select * from fornecedor;
                            
insert into FornecedorProduto (Fornecedor_idFornecedor, Produto_idProduto, FornecedorProduto_Quantidade) values
						 (7,1,200),
                         (9,1,140);                            
                            
select Fornecedor_RazaoSocial, Fornecedor_NomeFantasia, Produto_Nome, FornecedorProduto_Quantidade from fornecedor 
						inner join FornecedorProduto on Fornecedor_idFornecedor = idFornecedor
						inner join Produto on Produto_idProduto = idProduto;

insert into vendedor (Vendedor_RazaoSocial, Vendedor_NomeFantasia, Vendedor_CNPJ, Vendedor_Email, Vendedor_Celular, Vendedor_Telefone,
						Vendedor_CEP, Vendedor_Logradouro, Vendedor_Numero, Vendedor_Complemento, Vendedor_Bairro, Vendedor_Municipio, Vendedor_UF) values 
						('Tech eletronics', 'Technology', 23456789456321, 'tech@tech.com.br', 21988547414, null, 12354684, 'Rua Rio blue',
                        '5487',null, 'Barra da Tijuca', 'Rio de Janeiro', 'RJ'),
					    ('Botique Durgas','Durgas',12345678374541,'durgas@durgas.com.br',null, 3855446622, 98754214,'Rua Minas',74, null,
                        'Jaboatão','Unai', 'MG'),
						('Kids World','KW',45678912365448,'kw@kidsworld.com.br',11988552288, 1166554477, 77798542,'Rua da Liberdade',777, null,
                        'Liberdade','São Paulo', 'SP');
                        
select * from vendedor;

insert into VendedorProduto (Vendedor_idVendedor, Produto_idProduto, VendendorProduto_Quantidade) values 
						 (1,1,43),
                         (3,1,17),
                         (2,1,8);
                         
select vendedor_RazaoSocial, produto_Nome, VendendorProduto_Quantidade, Fornecedor_RazaoSocial, FornecedorProduto_Quantidade  from Vendedor inner join VendedorProduto on Vendedor_idVendedor = idVendedor
										inner join produto as p on Produto_idProduto = p.idProduto
                                        inner join FornecedorProduto as fp on fp.Produto_idProduto = p.idProduto
                                        inner join fornecedor as f on f.idFornecedor = fp.Fornecedor_idFornecedor;
#Não consegui o resultado que queria com a query acima
                                        

                    
                 