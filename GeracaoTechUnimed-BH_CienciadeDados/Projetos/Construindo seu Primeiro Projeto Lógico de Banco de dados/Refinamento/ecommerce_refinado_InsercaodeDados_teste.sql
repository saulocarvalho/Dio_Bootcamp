use ecommerce_refinado_teste;



insert into clientePF (ClientePF_CPF, ClientePF_Nome, ClientePF_Sobrenome, ClientePF_DataNascimento) 


	   values(12346789, 'Emanuel', 'M Carvalho', '2002-07-05');

select * from clientepf;

insert into Cliente (Cliente_idClientePF, cliente_Email, Cliente_Celular, Cliente_Telefone, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF)
			values('1','maria@msilva.com.br', 82987417417, null, 57025458, 'rua silva de prata', 29, null, 'Carangola', 'Cidade das flores', 'RJ');

select * from Cliente;


select * from clientepf inner join Cliente on idCliente = Cliente_idClientePF;

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
                         

                            
                            