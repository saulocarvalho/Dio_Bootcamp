use ecommerce_refinado_teste;



insert into clientePF (ClientePF_CPF, ClientePF_Nome, ClientePF_Sobrenome, ClientePF_DataNascimento) 


	   values(12346789, 'Emanuel', 'M Carvalho', '2002-07-05');

select * from clientepf;

insert into Cliente (Cliente_idClientePF, cliente_Email, Cliente_Celular, Cliente_Telefone, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF)
			values('1','maria@msilva.com.br', 82987417417, null, 57025458, 'rua silva de prata', 29, null, 'Carangola', 'Cidade das flores', 'RJ');

select * from Cliente;


select * from clientepf inner join Cliente on idCliente = Cliente_idClientePF;