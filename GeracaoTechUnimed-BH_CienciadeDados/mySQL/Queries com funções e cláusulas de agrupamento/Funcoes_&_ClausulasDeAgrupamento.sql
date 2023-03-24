desc departament;
desc employee;
select * from employee;
select * from departament;
select Dname, count(*) as Soma_Departamento, round(avg(salary),2) as Media_salario
		from employee, departament
        where Dno = Dnumber
        group by Dno
        order by Dname;
        
#Funções e Cláusulas de agrupamento
select * from employee;
select count(*) from employee;

select count(*) from employee, departament
		where Dno=Dnumber and Dname = 'Research';

#Número de funcionários por projeto
select Dno, count(*) as Numbers_of_employees, round(avg(salary),2) as salary_avg
		from employee
		group by dno;
        
select Pnumber, Pname, count(*)
		from project, works_on
        where Pnumber = Pno
        group by Pnumber, Pname;

#Número de salários diferentes
select count(distinct salary) from employee;

select sum(salary) as Total_salary, max(salary) as Maximum_salary, min(salary) as Minimum_salary, avg(salary) as Avarage_salary
		from employee;
        
select sum(salary) as Total_salary, max(salary) as Maximum_salary, min(salary) as Minimum_salary, avg(salary) as Avarage_salary
		from employee join departament on Dno = Dnumber
        where Dname = 'Research';
        
#Group by again
select Pnumber, Pname, count(*) from project, works_on
		where Pnumber = Pno
        group by Pnumber, Pname;
        
select Pnumber, Pname, count(*), round(avg(Salary),2) as Avarage_salary
		from project, works_on, employee
		where Pnumber = Pno and Ssn = Essn
        group by Pnumber
        order by Avarage_salary desc;
        
#Group by e having 
select Pnumber, Pname, count(*) from project, works_on
		where Pnumber = Pno
        group by Pnumber, Pname
        having count(*) >= 2;
        
select Dno, count(*) from employee
		where Salary > 50000
        group by Dno
        having count(*) > 1;
        
select Dno as Departament_Number, count(*) from employee as Number_of_employess
		where Salary > 20000 and Dno in (select Dno from employee
											group by Dno
                                            having count(*) > 2)
        group by Dno;
        