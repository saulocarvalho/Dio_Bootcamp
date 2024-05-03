1. Todos os cabeçalhos já foram para o Power BI de maneira correta;
2. Alteração de tipo de dado feita na coluna salário da tabela employee;
3. Apenas nulo na coluna super_ssn na tabela employee que é referente ao gerente;
4. Apenas James não possui super_ssn, pois é o gerente geral;
5. Todos departamentos possuem gerentes;
6. 
7. Dentre os 3 projetos com menos de 10 horas trabalhadas, em 2 deles os funcionários estão envolvidos com outros projetos, e que por sinal possuem mais de 30 horas trabalhadas. 1 dos 3 projetos com menos horas trabalhadas possui 0 horas trabalhadas e o employee (James Borg) não está vinculado a nenhum outro projeto,
Query utilizada no MySQL para facilitar a leitura: "select concat(Fname, " ", Lname) as Nome, Pname, hours from employee inner join works_on on ssn = essn
inner join project on pno = pnumber
order by nome;";
8. A coluna endereço foi dividida em 4 partes, número, endereço, cidade e Estado. Houve um pequeno problema com o delimitador do endereço Fire oak, com isso precisou ser ajustado manualmente;	
9. tabela employee mesclada com a tabela departament onde foi levado em consideração o Dno = Dnumber;
10.
11. Feito pela Query no MySQL: "select concat(e.Fname, " ", e.Minit, " ", e.Lname) as FullName_Manager, e.ssn, concat(m.Fname, " ", m.Minit, " ", m.Lname) as FullName_Employee, m.super_ssn  from employee e inner join departament on dno = dnumber
inner join employee m on e.ssn = m.super_ssn;";
12.
13.
14. Pelo motivo de desejarmos uma informação única;
15. Agrupado pela Query: "select concat(m.Fname, " ", m.Minit, " ", m.Lname) as FullName_Manager, m.ssn, count(e.Fname) as Quantity_Employees  from employee m inner join departament on dno = dnumber
inner join employee e on m.ssn = e.super_ssn
group by 2;"
16. 