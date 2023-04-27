use ecommerce_refinado;



insert into clientePF (ClientePF_CPF, ClientePF_Nome, ClientePF_Sobrenome, ClientePF_DataNascimento) 


	   values(12346789421, 'Emanuel', 'M Carvalho', '2002-07-05'),
			(65487465254, 'Saulo', 'D Carvalho', '2000-12-02'),
            (12332125125, 'Jorge', 'T Galhardo', '1997-05-13'),
            (22664456504, 'Ryan', 'F Vilar', '1973-03-24');
            

select * from clientepf;

insert into Cliente (Cliente_idClientePF, cliente_Email, Cliente_Celular, Cliente_Telefone, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF, Cliente_Regiao)
			values('1','Emano@emmc.com.br', 83987417417, null, 57025458, 'rua silva de prata', 29, null, 'Carangola', 'Cidade das flores', 'PB', 'Nordeste'),
					('2', 'saulo@sdc.com.br', 82965452154, 8233554411, 88047596, 'Rua Manoel Soares DAzevedo Maia', 255, null, 'Carianos', 'Maceió', 'AL', 'Nordeste'),
                    ('3', 'jorge@jtg.com.br', null, 6838485483, 69919817, 'Rua N2', 02, null, 'Conjunto Tucumã', 'Rio Branco', 'AC', 'Norte'),
                    ('4', 'ryan.vilar@geradornv.com.br',71993683614, 7133230670, 41950690, 'Travessa Professora Nilzete', 54, null, 'Rio Vermelho', 'Salvador', 'BA', 'Nordeste');

select * from Cliente;



select  distinct * from  cliente where exists (select cliente_idClientePF from ClientePF);
						

insert into produto (Produto_Nome, Produto_Categoria, Produto_Descricao, Produto_Marca, Produto_Modelo, Produto_Avaliacao, Produto_Valor) values
							  ('Notebook Dell Vostro 3510','Notebook','11ª geração Intel® Core™ i5-1135G7 (4-core, cache de 8MB, até 4.2GHz)','Dell', 'Vostro 3510', 4.8, 3500),
                              ('Desktop Dell XPS 8950', 'Desktop', '12ª geração Intel® Core™ i7-12700 - NVIDIA® GeForce RTX™ 3060 12GB GDDR6 - Memória de 16GB DDR5 SSD de 256GB PCIe NVMe M.2 + HD de 1TB (7200RPM)',
                              'Dell', 'XPS 8950', 5, 10449),
                              ('Memória Kingston Fury Beast', 'Memória', 'Memória Kingston Fury Beast, 8GB, 3200MHz, DDR4, CL16, Preto - KF432C16BB/8' ,'Kingston', 'Fury Beast', 4.9, 172.99),
                              ('PNY NVIDIA Geforce RTX 3060','Placa de Vídeo', 'Placa de Video PNY NVIDIA Geforce RTX 3060, 12 GB GDDR6, DLSS, Ray Tracing - VCG306012DFBPB1', 'PNY', 'RTX 3060', 4, 2310.99),
							  ('Asus TUF Gaming', 'Placa Mãe', 'Placa Mãe Asus TUF Gaming B660M-PLUS D4, Intel LGA 1700, mATX, DDR4, RGB', 'Asus', 'B660M-PLUS D4', 5, 1199.99),
                              ('Notebook ASUS VivoBook X513EA', 'Notebook', 'Intel® Core™ i5 - 11ª Geração - Intel® Iris® Xe - 16GB - 256GB SSD', 'Asus', 'X513EA-BQ3400W', 4.7, 4049.10);
                              
                              
                              
select * from Produto;

insert into pedido (Cliente_idCliente, Pedido_Status, Pedido_Descricao, Pedido_CodRastreamento, Pedido_ValorFrete) values 
							 (1, default,'Compra via App',25648, 150),
                             (1, 'Confirmado', 'Compra via Web Site', 54845, 100),
                             (2, default, 'Compra via App', 54421, 50),
                             (3, 'Cancelado', 'Com via Web Site', null, null),
                             (3, default, 'Compra via Web Site', 54231, 40),
                             (4, 'Confirmado', 'Compra via App', 89541, 120);
select * from pedido;
select * from pedido join cliente on Cliente_idCliente = idCliente
						join ClientePF on idCliente = idClientePF;					


insert into PedidoProduto (Pedido_idPedido, Produto_idProduto, PedidoProduto_Quantidade, PedidoProduto_Status, PedidoProduto_DataPedido) values
						 (1,3,2,default, '2023-01-23'),
                         (2, 5, 1, default, '2023-01-17'),
                         (3, 2, 1, default, '2023-03-01'),
                         (4, 6, 1, 'Sem estoque', '2023-04-14'),
                         (5, 1, 1, default, '2023-04-20'),
                         (6, 4, 2, default, '2023-04-24');
                         
                         
select concat (ClientePF_Nome,' ', ClientePF_Sobrenome) as NomeCliente, Produto_Nome, Produto_Categoria, PedidoProduto_Quantidade as Quantidade, Produto_Descricao, Produto_Valor, Pedido_CodRastreamento, Pedido_ValorFrete  
							from PedidoProduto inner join pedido on Pedido_idPedido = idPedido
							inner join produto on Produto_idProduto = idProduto
                            inner join Cliente on Cliente_idCliente = idCliente
                            inner join ClientePF on idCliente = idClientePF;

insert into Pagamento (Cliente_idClientePF, Cliente_idClientePJ, Pedido_idPedido, Pagamento_TipoPagamento, Pagamento_CartaoNumero, Pagamento_CartaoValidade, Pagamento_CartaoCVV, Pagamento_ValorTotal, Pagamento_Aprovado) values
						(1, null, 1, 'Cartão de crédito', 123456789102, 072027, 666, 322.99, default),
                        (1,null, 2, 'Cartão de crédito', 534456200102, 042030, 412, 1299.99, default),
                        (2, null, 3, 'PIX', null, null, null, 10549, default),
                        (3,null, 4, 'Cartão de débito', 942255021347, 01229, 987, 4049.10, false),
                        (3, null, 5, 'Cartão de débito', 942255021347, 01229, 987, 3540, default),
                        (4, null, 6, 'Boleto', null, null, null, 2430.99, default);
select * from pagamento as p inner join Cliente as c on c.idCliente = p.Cliente_idClientePF
						inner join ClientePF as cpf on cpf.idClientePF = c.idCliente;
                        
select concat (ClientePF_Nome,' ', ClientePF_Sobrenome) as NomeCliente, Produto_Nome, Produto_Categoria, PedidoProduto_Quantidade as Quantidade, Produto_Descricao, Produto_Valor, Pedido_ValorFrete , Pagamento_TipoPagamento, Pagamento_ValorTotal, Pedido_Status, Pagamento_Aprovado
							from pedido as pe inner join PedidoProduto as pp on pe.idPedido = pp.Pedido_idPedido
							inner join produto as p on p.idProduto = pp.Produto_idProduto
                            inner join pagamento as pa on pa.Pedido_idPedido = pe.idPedido
                            inner join Cliente as c on c.idCliente = pe.Cliente_idCliente
                            inner join ClientePF as cpf on cpf.idClientePF = idCliente;
                        
insert into estoque (Estoque_Cidade,Estoque_UF) values 
							('Maceió','AL'),
                            ('João Pessoa','PB'),
                            ('Belo Horizonte','MG'),
                            ('Manaus','AM'),
                            ('São Paulo','SP'),
                            ('Brasília','DF');  
                            
		select * from produto;
         select * from estoqueProduto inner join estoque on Estoque_idEstoque = idEstoque
										inner join produto on idProduto = Produto_idProduto;
insert into estoqueProduto (Estoque_idEstoque, Produto_idProduto,EstoqueProduto_Quantidade) values
						 (1,3,100),   #1 note dell 2 desktop dell 3 memoria 4 placa video 5 placa mae 6 note asus
                         (1, 4, 30),
                         (1, 5, 15),
                         (2, 6, 60),
                         (3, 3, 200),
                         (3, 5, 45),
                         (4, 6, 300),
                         (5, 1, 400),
                         (5, 2, 300),
                         (6,6,200);
select Produto_Nome, Produto_Marca, EstoqueProduto_Quantidade, Estoque_cidade, Estoque_UF 
										from estoqueProduto 
                                        inner join estoque on Estoque_idEstoque = idEstoque
										inner join produto on idProduto = Produto_idProduto;   
                                        
insert into fornecedor (Fornecedor_RazaoSocial, Fornecedor_CNPJ, Fornecedor_NomeFantasia, Fornecedor_Email, Fornecedor_Celular,
						Fornecedor_Telefone, Fornecedor_CEP, Fornecedor_Logradouro, Fornecedor_Numero, Fornecedor_Complemento, Fornecedor_Bairro,
                        Fornecedor_Municipio, Fornecedor_UF) values 
							('Almeida e filhos', 12345678912345,'Marquinhos construções', 'marquinhos@marquinhos.com.br',
                            77955442232, 7733150121, 57435214, 'Rua abcs', 542, null, 'desconhecidos', 'Salvador', 'BA'),
                            ('Eletrônicos Silva',85419649143457,'Flavinho do eletrônico', 'flavinho@flavio.com.br',null,6133998424,
                            47895324, 'Rua Trindade', 578, null, 'Asa Norte', 'Ceilândia', 'DF'),
                            ('Eletrônicos Emanoshow', 93456789934695,'Emanuelsonzin eletro', 'emanuelson@sonzin.com.br', 
                            83955554433, null, 69852457, 'Rua Ketchup', 2878, null, 'Tambaú', 'João Pessoa', 'PB');   
                            
select * from fornecedor;
                            
insert into FornecedorProduto (Fornecedor_idFornecedor, Produto_idProduto, FornecedorProduto_Quantidade) values
						 (1,3,1300),   #1 note dell 2 desktop dell 3 memoria 4 placa video 5 placa mae 6 note asus
                         (1,4,1154),
                         (1,5,980),
                         (2,6, 800),
                         (3, 1, 1540),
                         (3,2, 1354);                            
                            
select Fornecedor_RazaoSocial, Fornecedor_NomeFantasia, Produto_Nome, FornecedorProduto_Quantidade, Fornecedor_UF from fornecedor 
						inner join FornecedorProduto on Fornecedor_idFornecedor = idFornecedor
						inner join Produto on Produto_idProduto = idProduto;

insert into vendedor (Vendedor_RazaoSocial, Vendedor_NomeFantasia, Vendedor_CNPJ, Vendedor_Email, Vendedor_Celular, Vendedor_Telefone,
						Vendedor_CEP, Vendedor_Logradouro, Vendedor_Numero, Vendedor_Complemento, Vendedor_Bairro, Vendedor_Municipio, Vendedor_UF) values 
						('Tech eletronics', 'Technology', 23456789456321, 'tech@tech.com.br', 21988547414, null, 12354684, 'Rua Rio blue',
                        '5487',null, 'Tambaú', 'João Pessoa', 'PB'),
					    ('Botique Durgas','Durgas',12345678374541,'durgas@durgas.com.br',null, 3855446622, 98754214,'Rua Minas',74, null,
                        'Jaboatão','Belo Horizonte', 'MG'),
						('Kids World','KW',45678912365448,'kw@kidsworld.com.br',11988552288, 1166554477, 77798542,'Rua da Liberdade',777, null,
                        'Liberdade','São Paulo', 'SP'),
                        ('Camille & Moraes Tecnologia', 'CMT', '13167385000128', 'camille.moraes@cmoraes.com.br', 82998552142, null, 57040509, '5ª Travessa Santo Antonio', 25,
                        null, 'Jatiúca','Maceió', 'AL'),
                        ('Regufe Tech', 'Regufe ','47271766000174', 'brunna@regufe.com.br', null, 9235650744, 69036070, 'Beco Lobo Soropita', 823, null,
                        'Compensa', 'Manaus', 'AM');
                        
select * from vendedor;

insert into VendedorProduto (Vendedor_idVendedor, Produto_idProduto, VendendorProduto_Quantidade) values 
						 (1,1,3), #1 note dell 2 desktop dell 3 memoria 4 placa video 5 placa mae 6 note asus
                         (1,2,1),
                         (1,3,8),
                         (1,4,12),
                         (1,5,7),
                         (1,6,5),
                         (2,1,10),
                         (2,2,7),
                         (2,3,25),
                         (2,4,14),
                         (2,5,11),
                         (2,6,5),
                         (3,1,30),
                         (3,2,35),
                         (3,3,40),
                         (3,4,50),
                         (3,5,15),
                         (3,6,22),
                         (4,1,15),
                         (4,2,12),
                         (4,3,30),
                         (4,4,8),
                         (4,5,3),
                         (4,6,0),
                         (5,1,0),
                         (5,2,0),
                         (5,3,15),
                         (5,4,8),
                         (5,5,4),
                         (5,6,30);
                         
select *  from VendedorProduto inner join produto on Produto_idProduto = idProduto
								inner join vendedor on Vendedor_idVendedor = idVendedor
                                order by Vendedor_RazaoSocial; 
                                
select Produto_Nome, Produto_Categoria, Produto_Descricao,VendendorProduto_Quantidade, Vendedor_RazaoSocial, Vendedor_UF 
								from VendedorProduto as vp inner join Produto on Produto_idProduto = idProduto
								inner join Vendedor on Vendedor_idVendedor = idVendedor
                                where vp.Produto_idProduto = idProduto;

                                        

                    
