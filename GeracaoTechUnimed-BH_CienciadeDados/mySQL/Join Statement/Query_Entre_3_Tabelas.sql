#Joins com mais de 3 tabelas

use company;
#Project, works_on e employee
select concat(Fname, ' ', Lname) as FullName, Dno, Pname, Pno, Plocation  from employee 
		inner join works_on on Ssn = Essn 
		inner join project on Pno = Pnumber
        #where Plocation like 'S%' #Todas a localizações começam com S
        order by Pnumber;
        
#Departament, dept_location, employee
select Dnumber, Dname, Fname, salary, round(salary * 0.05, 2) as Bonus from departament 
		inner join dept_locations using(Dnumber)
        inner join employee on Ssn = Mgr_ssn
        group by Dnumber
        having count(*) > 1;