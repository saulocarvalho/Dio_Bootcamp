show databases;
#use company_constraints;
show tables;
create or replace view v_today (today) as select current_date();
select * from v_today;
select * from employee;


create or replace view employess_salary_27000_view as
select concat (Fname, Minit, Lname) as Nome, Salary, Dno as Dept_number from employee
		where salary > 26999;
        

select * from employess_salary_27000_view;

create or replace view employess_salary_view as
select concat (Fname, Minit, Lname) as Nome, Salary, Dno as Dept_number  from employee
		where Sex = 'F';
        
        
select * from employess_salary_view;   


create or replace view employess_dependent_view as
select concat (Fname, Minit, Lname) as Nome, d.dependent_name as Dependent, Dno as Departament
		from employee e
        inner join dependent d on e.Ssn = d.Essn;
        
select * from employess_dependent_view;

show tables;	