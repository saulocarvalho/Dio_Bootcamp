use ecommerce_refinado;

#Query usando where --- Cliente da região Nordeste
select * from Cliente where Cliente_Regiao = 'Nordeste';

#Pedidos por Cliente
select concat(ClientePF_Nome, ' ', ClientePF_Sobrenome) as Cliente, Cliente_Email, Pedido_Status, Pedido_Descricao, Pedido_Codrastreamento 
						from pedido join cliente on Cliente_idCliente = idCliente
						join ClientePF on idCliente = idClientePF;	

#Quantos pedidos foram feitos					
select count(*) from pedido join cliente on Cliente_idCliente = idCliente
						join ClientePF on idCliente = idClientePF;	
                        
#Quantidade de pedido por cliente                        
select ClientePF_nome, count(*) as NumeroPedidos from Cliente inner join ClientePF on idCliente = idClientePF
			inner join pedido on idClientePF = Cliente_idCliente
			group by idCliente;
            
#Quantidade de pedido por cliente, onde a quantidade de pedidos são maiores que 1
select ClientePF_nome, count(*) as NumeroPedidos from Cliente inner join ClientePF on idCliente = idClientePF
			inner join pedido on idClientePF = Cliente_idCliente
			group by idCliente
            having count(*) > 1;
            
#Quantidade de produto por estoque
select Produto_Nome, Produto_Marca, EstoqueProduto_Quantidade, Estoque_cidade, Estoque_UF 
										from estoqueProduto 
                                        inner join estoque on Estoque_idEstoque = idEstoque
										inner join produto on idProduto = Produto_idProduto;   
                                        
#Quantidade de produto por fornecedor
select Fornecedor_RazaoSocial, Fornecedor_NomeFantasia, Produto_Nome, FornecedorProduto_Quantidade, Fornecedor_UF from fornecedor 
						inner join FornecedorProduto on Fornecedor_idFornecedor = idFornecedor
						inner join Produto on Produto_idProduto = idProduto;									

#Quantidade de produto por fornecedor
select Produto_Nome, Produto_Categoria, Produto_Descricao,VendendorProduto_Quantidade, Vendedor_RazaoSocial, Vendedor_UF 
								from VendedorProduto as vp inner join Produto on Produto_idProduto = idProduto
								inner join Vendedor on Vendedor_idVendedor = idVendedor
                                where vp.Produto_idProduto = idProduto
                                order by Produto_Nome;	
                                
#Relação produto, pedido, pagamento e cliente
select concat (ClientePF_Nome,' ', ClientePF_Sobrenome) as NomeCliente, Produto_Nome, Produto_Categoria, PedidoProduto_Quantidade as Quantidade, Produto_Descricao, Produto_Valor, Pedido_ValorFrete ,PedidoProduto_dataPedido,  Pagamento_TipoPagamento, Pagamento_ValorTotal, Pedido_Status, Pagamento_Aprovado
							from pedido as pe inner join PedidoProduto as pp on pe.idPedido = pp.Pedido_idPedido
							inner join produto as p on p.idProduto = pp.Produto_idProduto
                            inner join pagamento as pa on pa.Pedido_idPedido = pe.idPedido
                            inner join Cliente as c on c.idCliente = pe.Cliente_idCliente
                            inner join ClientePF as cpf on cpf.idClientePF = idCliente
                            order by PedidoProduto_dataPedido;                                        

			