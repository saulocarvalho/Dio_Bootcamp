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
                            

              

