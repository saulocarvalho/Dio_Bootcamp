use ecommerce_refinado_teste;



insert into clientePF (ClientePF_CPF, ClientePF_Nome, ClientePF_Sobrenome, ClientePF_DataNascimento) 


	   values(12346789421, 'Emanuel', 'M Carvalho', '2002-07-05'),
			(65487465254, 'Saulo', 'D Carvalho', '2000-12-02'),
            (12332125125, 'Jorge', 'T Galhardo', '1997-05-13'),
            (22664456504, 'Ryan', 'F Vilar', '1973-03-24');
            

select * from clientepf;

insert into Cliente (Cliente_idClientePF, cliente_Email, Cliente_Celular, Cliente_Telefone, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF)
			values('1','Emano@emmc.com.br', 83987417417, null, 57025458, 'rua silva de prata', 29, null, 'Carangola', 'Cidade das flores', 'PB'),
					('2', 'saulo@sdc.com.br', 82965452154, 8233554411, 88047596, 'Rua Manoel Soares DAzevedo Maia', 255, null, 'Carianos', 'Maceió', 'AL'),
                    ('3', 'jorge@jtg.com.br', null, 6838485483, 69919817, 'Rua N2', 02, null, 'Conjunto Tucumã', 'Rio Branco', 'AC'),
                    ('4', 'ryan.vilar@geradornv.com.br',71993683614, 7133230670, 41950690, 'Travessa Professora Nilzete', 54, null, 'Rio Vermelho', 'Salvador', 'BA');

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
                         (1, 2, 'AL'),  ###Tabela alterar, inserir dados e reprocessar tudo
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
                                        

                    
                 