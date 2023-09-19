use company;
show tables;

select * from employess_salary_27000_view;

select * from employee;
update employess_salary_27000_view
	set Dept_number = 5
    where Nome = 'JohnBSmith';

select * from employess_dependent_view;

update employess_dependent_view
		set Dependent = 'Abner' and Nome = 'Father'
        where Departament = 4;

