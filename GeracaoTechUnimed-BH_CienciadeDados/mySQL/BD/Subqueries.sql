-- subqueries 

show databases;
use company_constraints;

select distinct Pnumber from project 
	where Pnumber in 
		 (select distinct Pno from works_on, employee
        where Essn = Ssn and Lname = 'Smith')
        or 
        (select Pnumber from project, department, employee
        where Mgr_ssn = Ssn and Lname = 'Smith' and Dnum = Dnumber);
        
select distinct * from works_on
	where (Pno, Hours) in (select Pno, Hours from works_on
										where Essn=123456789);
                                        
-- Cláusulas com exists e unique

-- QUais employess possuem dependentes?
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e
	where exists (select * from dependent as d
						where e.Ssn = d.Essn);

-- Quais employess possuem filhas dependentes
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e
	where exists (select * from dependent as d
						where e.Ssn = d.Essn and relationship = 'daughter');
             
-- sem dependentes
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e
	where not exists (select * from dependent as d
						where e.Ssn = d.Essn);
                        
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e
	where exists (select * from dependent as d
						where e.Ssn = d.Essn)
                        and
                        (select * from department
                        where Ssn = Mgr_ssn);
-- Solução da query acima                        
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e, department d
	where (e.Ssn = D.Mgr_ssn) and exists (select * from dependent as d where e.Ssn = D.Essn);
                        
-- Employess com 2 ou mais dependentes
select concat(e.Fname,' ', e.Lname) as Full_name from employee as e
	where (select count(*) from dependent where Ssn = Essn)>=2;
    
select distinct Essn, Pno from works_on where Pno in (1,2,3);