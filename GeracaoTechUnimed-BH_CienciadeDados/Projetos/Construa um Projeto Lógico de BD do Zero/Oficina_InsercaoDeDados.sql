use oficina;

insert into Cliente (Cliente_CPF, Cliente_Nome, Cliente_Sobrenome, Cliente_DataNascimento, cliente_Email, Cliente_Celular, Cliente_CEP, Cliente_Logradouro, Cliente_Numero, Cliente_Complemento, Cliente_Bairro, Cliente_Municipio, Cliente_UF)
					values ('77287406365', 'Alzira', 'de Barros Nogueira', '1965-07-19', 'alzira.nogueira@alzira.com.br', '86979154445', '64007230', 'Rua Fagundes Varela', '30', null , 'Primavera', 'Teresina', 'PI'),
							('86844477430', 'José ', 'Milton Figueredo Soriano', '1948-12-25', 'jose.soriano@jose.com.br', '84986821766', '59064745', 'Alameda Marechal Sucupira', '570', null, 'Candelária', 'Natal', 'RN'),
                            ('57143610402', 'Patrick', 'Coimbra Silveira', '1960-01-28', 'patrick.coimbra@patrick.com.br', '84971346457', '59129470', 'Rua Luiz Gonzaga de Souza', '47', null, 'Lagoa Azul', 'Natal', 'RN'),
                            ('92143049986', 'Herisomar', 'Auzier Matos', '1982-10-05', 'herisomar.matos@heri.com.br', '4621714451', '86058302', 'Rua Josepha Montier Peres', '740', null, 'Esperança', 'Londrina', 'PR'),
                            ('53397744733', 'Vera', 'Miranda Goncalves', '1951-12-10', 'vera.goncalves@vera.com.br', '22987933547', '25570525', 'Travessa São Vicente', '87', null, 'Vila Dias Lopes', 'São João de Meriti', 'RJ'),
                            ('11158042868', 'Francisco', 'Youssef Simoes', '1980-02-12', 'francisco.simoes@simoes.com.br', '17997531862', '12286295', 'Travessa Antônio Luiz dos Santos', '6547', null, 'Vila Galvão', 'Caçapava', 'SP');
                            
                            select * from Cliente;
                            
insert into Veiculo (Cliente_idCliente, Veiculo_Placa, Veiculo_Marca, Veiculo_Modelo, Veiculo_Ano, Veiculo_Cor, Veiculo_Renavam)
			values(1, 'MUK9077','Mitsubishi' , 'Pajero TR4 2.0/ 2.0 Flex 16V 4x4 Mec.', '2003', 'Branco', 07555187435),
					(4, 'MUF3746', 'Troller', 'RF Esport T-4 4x4 2.0 Cap. R', '1999', 'Vermelho', '29558463116'),
                    (6, 'MUL5057', 'Saturn', 'SL-2 1.9', '1991', 'Branco', '94583538450'),
                    (6, 'MVI5432', 'HAFEI', 'Towner Jr. Pick-up 1.0 8V 48cv  CD 4p', '2010', 'Amarelo', '90088022248'),
                    (5, 'MUY7792', 'Mercury', 'Sable LS 3.0 V6', '1992', 'Azul', 09841585052),
                    (2, 'MUY7150','Fiat', 'Strada 1.3 mpi Fire 8V 67cv CE', '2003', 'Azul', '89664924524' ),
                    (3, 'MVD8569', 'Fiat', 'Fiat Mille', '2001', 'Vermelho', '76039098940');
                    
select * from Veiculo inner join Cliente on Cliente_idCliente = idCliente;         

insert into mecanico (Mecanico_Matricula, Mecanico_Nome, Mecanico_CPF, Mecanico_Especialidade)
			values ('5469852','Agenor Rangel Portela', '93835735462', 'Nível I'),
					('5423658','Aparecida Holanda da Sousa', '78218650440', 'Nível I'),
                    ('0598753','Aderbal Braz Mesquita', '85634362440', 'Nível II'),
                    ('7776542','Adso Holanda Campelo', '25163347454', 'Nível II'),
                    ('1325648','Ezeni Sá Norte', '81430576405', 'Nível III');

select * from mecanico;

insert into Orcamento (Orcamento_Descricao, Orcamento_TipoServico, Orcamento_Data)
			values ('Troca da correia dentada', 'Mecanico', '2023-05-15'),
					('Troca de Oleo', 'Mecanico', '2023-05-10'),
                    ('Troca da embreagem', 'Mecanico', '2023-06-02'),
                    ('Troca dos Farois', 'Eletrico', '2023-05-25'),
                    ('Troca de Oleo', 'Mecanico', '2023-06-02');

select * from Orcamento;

insert into OrdemServico (OS_Protocolo, OS_DataEmissao, OS_DataConclusao, OS_ValorTotal, OS_Garantia)
			values ('12345678', '2023-05-15', '2023-05-18', '380', '2025-05-18'),
					('87654321', '2023-05-10', '2023-05-11', '280', null),
                    ('55442266', '2023-06-05', '2023-06-20', '1500', '2028-06-20'),
                    ('10235047', '2023-05-29', '2023-05-29', '140', '2024-05-29'),
                    ('10156841', '2023-06-05', '2023-06-20', '280', null);
                      

insert into Produto (Produto_Descricao,Produto_Valor)
			values ('Correia dentada', '300'),
					('Oleo', '200'),
                    ('Kit Embreagem', '1200'),
                    ('Farol', '120'),
                    ('Oleo', '200');
                    
                    
insert into OrcamentoVeiculo (Orcamento_idOrcamento, Veiculo_idVeiculo, OrcamentoVeiculo_DataPrevistaEntrega)
			values ('1', '3', '2023-05-18'),
					('2', '4', '2023-05-10'),
                    ('3', '2', '2023-06-20'),
                    ('4', '7', '2023-05-29'),
                    ('5', '2', '2023-06-20');

select * from OrcamentoVeiculo;

 insert into OrcamentoMecanico(Orcamento_idOrcamento, Mecanico_idMecanico, OrcamentoMecanico_ValorMecanico)
				values ('1', '3', '80'),
						('2', '2', '80'),
                        ('3', '5', '300'),
                        ('4', '1', '40'),
                        ('5', '2', '80');
 
insert into OSOrcamento (OS_idOrdemServico,Orcamento_idOrcamento, OSOrcamento_valor) 
				values ('1', '1', '300'),
						('2', '2', '200'),
                        ('3', '3', '1200'),
                        ('4', '4', '100'),
                        ('5', '5', '200');

insert into OSProduto (OS_idOrdemServico, Produto_idProduto, OSProduto_Quantidade)
				values ('1', '1', '1'),
						('2', '2', '1'),
                        ('3', '3', '4'),
                        ('4', '4', '2'),
                        ('5', '2', '1');


