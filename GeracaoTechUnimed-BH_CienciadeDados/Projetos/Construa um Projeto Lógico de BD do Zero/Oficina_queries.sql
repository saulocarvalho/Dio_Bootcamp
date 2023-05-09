use oficina;


#Clientes que fizeram orçamento ordenado por data
select Orcamento_idOrcamento, OrcamentoVeiculo_DataPrevistaEntrega as DataPrevista,  concat(Cliente_Nome, ' ', Cliente_Sobrenome) NomeCliente, Veiculo_Marca, Veiculo_Modelo 
								from orcamentoveiculo inner join veiculo on Veiculo_idVeiculo = idVeiculo
								inner join Cliente on Cliente_idCliente = idCliente
                                order by OrcamentoVeiculo_DataPrevistaEntrega;
                                

#Cliente que possuem  mais de um Veiculo
select concat(Cliente_Nome, ' ',Cliente_Sobrenome) as NomeCliente, count(*) as NumeroDeVeiculos from veiculo inner join cliente on Cliente_idCliente = idCliente
				group by NomeCliente
                having count(*) > 1;
 
 #Data prevista para conclusão, data de abertura da OS, data de conclusão e o serviço feito
select OS_protocolo as Protocolo, Orcamento_descricao as Descricao,concat(Cliente_Nome, ' ',Cliente_Sobrenome) as NomeCliente, Veiculo_marca, Veiculo_Ano, OS_DataEmissao as DataEmissaoOS, OS_DataConclusao as DataConclusaoOS, Orcamento_Data as DataOrcamento, OrcamentoVeiculo_DataPrevistaEntrega as DataPrevista
							from OrdemServico inner join OSOrcamento as oso on idOrdemServico = oso.OS_idOrdemServico
                            inner join Orcamento as o on oso.Orcamento_idOrcamento = o.idOrcamento
                            inner join OrcamentoVeiculo as ov on ov.Orcamento_idOrcamento = o.idOrcamento
                            inner join Veiculo as v on v.idVeiculo = ov.veiculo_idVeiculo
                            inner join Cliente as c on v.Cliente_idCliente = c.idCliente;
                            
#Mecanico responsável por cada serviço
select OS_protocolo as Protocolo, Orcamento_descricao as Descricao,concat(Cliente_Nome, ' ',Cliente_Sobrenome) as NomeCliente, Veiculo_marca, Veiculo_Ano, OSOrcamento_valor as ValorOrcamento, Mecanico_Nome, Mecanico_Especialidade, OrcamentoMecanico_ValorMecanico, OS_ValorTotal as ValorTotal
							from OrdemServico inner join OSOrcamento as oso on idOrdemServico = oso.OS_idOrdemServico
                            inner join Orcamento as o on oso.Orcamento_idOrcamento = o.idOrcamento
                            inner join OrcamentoMecanico as om on om.Orcamento_idOrcamento = o.idOrcamento
                            inner join Mecanico as m on m.idMecanico = om.Mecanico_idMecanico
                            inner join OrcamentoVeiculo as ov on ov.Orcamento_idOrcamento = o.idOrcamento
                            inner join Veiculo as v on v.idVeiculo = ov.veiculo_idVeiculo
                            inner join Cliente as c on v.Cliente_idCliente = c.idCliente;
						
#Valores totais do serviço que são maiores que R$300                        
select os_protocolo as protocolo, os_valorTotal from OrdemServico inner join OSorcamento on idOrdemServico = OS_idOrdemServico
									where os_valortotal > 300;