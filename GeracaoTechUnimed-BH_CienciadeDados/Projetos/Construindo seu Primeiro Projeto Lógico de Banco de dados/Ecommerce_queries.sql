use ecommerce;

select * from pedido;
delete from pedido where idPedido = 5;

select * from cliente c, pedido p 
			where c.idCliente = idPedidoCliente
            group by idPedido;
            
select * from cliente left outer join pedido on idCliente = idPedidoCliente;

select * from produto;
select * from ProdutoPedido;
select * from pedido;

#Recupera pedido com produto associado
select * from Cliente inner join pedido on idCliente = idPedidoCliente
			inner join produtoPedido on idProdutoPedido = idPedido;

#Recupera pedido com produto associado, agrupado por idCliente
select idCliente, Pnome, count(*) as NumeroDePedidos from Cliente inner join pedido on idCliente = idPedidoCliente
			inner join produtoPedido on idProdutoPedido = idPedido
            group by idCliente;
		
#Recupera quantos pedidos foram realizados pelo clientes
select idCliente, Pnome, count(*) as NumeroDePedidos from Cliente inner join pedido on idCliente = idPedidoCliente
			group by idCliente;