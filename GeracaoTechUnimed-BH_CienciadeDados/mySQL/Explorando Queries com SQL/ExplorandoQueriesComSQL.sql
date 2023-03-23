use company;
select * from employee;
select Fname, Minit, Lname || ',' || ',' || state as complete_name from employee;
select concat(Fname, " ", Minit," ", Lname) as complete_name from employee;

select Fname, Lname, salary, salary * 0.011 from employee;
select Fname, Lname, salary, salary * 0.011 as INSS from employee;
select Fname, Lname, salary, round(salary * 0.011, 2) as INSS from employee;
select concat(Fname, " ",Minit, " ",Lname) as Ful_name, salary, round(salary * 0.011, 2) as INSS from employee;

#Definir aumento de salário para os gerentes que trabalham no projeto associado ao ProductX
select concat(Fname, " ", Lname) as First_Last_Name, salary, round(salary * 1.1, 2) as increased_salary  
		from employee e, works_on as w, project as p
		where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname = 'ProductX');
        
#Definindo alias para legibilidade da consulta
select concat(e.Fname, " ", e.Lname) as Employee_Name, e.Address 
		from employee e, departament d
        where d.Dname = 'Research' and d.Dnumber = e.Dno;
        
        
#between
select * from employee where (salary between 30000 and 40000);


#Recuperando todos os gerentes que trabalham em Stafford
select d.Dname as Departament_Name, concat(Fname, " ", Lname) as Manager
		from departament d, dept_locations l, employee e
		where d.Dnumber = l.Dnumber and Dlocation = 'Stafford' and Mgr_ssn = e.Ssn;

select * from dept_locations;
show tables;
select * from departament;
select * from works_on;
desc project;
#Recuperando todos os gerentes, departamentos e seus nomes
select Pnumber, Dnum, Lname, Address, Bdate, p.Plocation
		from departament d, Project p, employee e
		where d.Dnumber = p.Dnum and p.Plocation = 'Stafford' and Mgr_ssn = e.Ssn;


#Like e Between 
select * from project;

select concat(Fname, " ", Lname) as Name_And_LastName, Dname as Department_name, Address
		from employee, departament
        where (Dno = Dnumber and Address like '%Houston%');
        
        
select concat(Fname, " ",Lname) as Name_And_Lastnme, salary 
		from employee 
		where (salary between 30000 and 40000);
        
        
#Mais operadores lógicos
select Bdate, Address from employee where Fname = 'John' and Lname = 'Smith';

select * from departament where Dname = 'Research' or Dname = 'Administration';

select concat(Fname, " ", Lname) as Name_And_LastName from departament, employee  where Dname = 'Research' and Dnumber = Dno;

use company;
select Pnumber, Fname from project, departament, employee
	where Mgr_ssn = Ssn;
select Pno, Fname from works_on, employee
	where Essn = Ssn and Lname = 'Smith';
  
  
select Fname from employee;
select Dependent_name from dependent;
#Exists
select E.Fname, E.Lname from employee e
		where exists(select * from dependent d
						where E.Ssn = D.Essn and E.Sex = D.Sex and E.Fname = D.Dependent_name);
                        
select distinct Fname, Essn from works_on, employee
			where Pno in (1,2,3) and Essn = Ssn;
