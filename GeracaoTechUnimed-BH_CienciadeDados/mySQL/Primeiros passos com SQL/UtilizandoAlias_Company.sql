use company;
show tables;

desc departament; #Dnumber
desc dept_locations; #Dnumber

select * from departament;
select * from dept_locations;

select Dname, Dlocation from departament as d, dept_locations as dl
		where d.Dnumber = dl.Dnumber;
        
select concat(Fname, ' ',Lname) as Employee_name from employee;