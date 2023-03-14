-- Queries with Alias

use company_constraints;
show tables;

desc department;
desc dept_locations;

select * from department;
select * from dept_locations;	


-- retirar a ambiguidade através do alias ou AS statement
select Dname, l.Dlocation as Department_anme
from department as d, dept_locations as l where d.Dnumber = l.Dnumber;

select concat(Fname, ' ', Lname) as Employees_names from employee;

--
--
-- Expressões e alias
--
-- Valor do INSS
use company_constraints;
select Fname, Lname,salary, salary*0.011 as INSS from employee;
select Fname, Lname,salary, round(salary*0.011,2) as INSS from employee;

-- Definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProductX
desc project;
	select * from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber);
    

	select concat(Fname, ' ', Lname) as complete_name, salary, round(salary*1.1,2) as increased_salary
    from employee as e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX');
    
    select concat(e.Fname, e.Lname) as name, e.Address from employee as e, department as d
    where d.Dname = 'research' and d.Dnumber = e.Dno;
    
    
--
--
-- Expressões e concatanação de strings
--
--

-- Recuperando informações dos departamentos presentes em Stafford
select Dname as department_name, Mgr_ssn as Manager, Address from department d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Dlocation = 'Stafford'; 

-- Todos os gerentes que trabalham em Sttaford
select Dname as department_name, concat(Fname, ' ', Lname) as Manager from department d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- Recuperando todos os gerentes, departamentos e seus nomes
select Dname as department_name, concat(Fname, ' ', Lname) as Manager, Dlocation from department d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;


select Pnumber, Dnum, Lname, Address, Bdate, p.Plocation from department d, project p, employee e
where d.Dnumber = p.Dnum and p.Plocation= 'Stafford' and Mgr_ssn = e.Ssn;


--
-- Like e betwenn
select * from employee;

select concat(Fname, ' ', Lname) as Full_name, Dname, Address as Department_name 
from employee, department
where (Dno = Dnumber and Address like '%Houston%'); 

select concat(Fname, ' ', Lname) as Full_name from employee where (Salary > 30000 and Salary < 40000);

select concat(Fname, ' ', Lname) as Full_name, salary from employee where (Salary between 20000 and 40000);

--
--
-- Operadores lógicos
--
Select Bdate, Address from employee where Fname= 'John' and Lname = 'Smith';

select * from department where Dname = 'Research' or Dname = 'Administration';

select concat(Fname, ' ', Lname) as Full_name from employee, department where Dname = 'Research' and Dnumber = Dno;