#Cláusulas com exists e unique 

#Employees que possuem  filhos
select concat(e.Fname, " ", e.Lname) from employee e
		where exists (select * from dependent d 
						where e.Ssn = d.Essn);
#Que não possuem
select concat(e.Fname, " ", e.Lname) from employee e
		where not exists (select * from dependent d 
						where e.Ssn = d.Essn);
                        
#Gerente que possuem pelo menos 1 dependente
select concat(e.Fname, " ", e.Lname) from employee e
		where exists (select * from dependent d 
						where e.Ssn = d.Essn) and (select * from departament
													where Ssn = Mgr_ssn);
#Solução da querie acima
select concat(e.Fname, " ", e.Lname) from employee e, departament d
	where (e.Ssn = d.Mgr_ssn) and exists (select * from dependent d where e.Ssn = d.Essn);

select Fname, Lname from employee, departament
	where Ssn = Mgr_ssn;
    
#Mais de um dependente
select concat(e.Fname, " ", e.Lname) from employee e
	where (select count(*)  from dependent where Ssn=Essn)>=3;

select distinct Essn from works_on where Pno in (1,2,3);
