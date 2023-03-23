#Subqueries

select distinct Pnumber from project 
			where Pnumber in (select distinct Pno from works_on, employee #Smith Trabalhando
								where Essn = Ssn and Lname = 'Smith')
							or
                            (select Pnumber from Project, Departament, employee #Smith Gerenciando 
								where Mgr_ssn = Ssn and Lname = 'Smith' and Dnum = Dnumber); 
                                
select distinct * from works_on
		where (Pno, Hours) in (select Pno, Hours from works_on
								where Essn=123456789);
            