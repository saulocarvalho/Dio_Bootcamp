use company;
show tables;

select * from employee;
select * from departament;

select Dno, Ssn from employee as e inner join departament as d on Dno = Dnumber;

#Categorizar os departamentos por números de colaboradores
select Dno, count(*) from employee as e 
	inner join departament as d on Dno = Dnumber 
    group by 1;
    
#Projetos por departamento
select * from project;

select Pname, Dname, Dnum from project as p inner join departament as d on Dnum = Dnumber;

select Dname, count(*) from project as p inner join departament as d on Dnum = Dnumber group by 1 order by Dname;


select * from employee;


#Discretização
select Fname,
	case
		when Salary > 39000 then 'Executivo'
        when Salary > 29000 then 'Senior'
		when Salary > 19000 then 'Pleno'
        else 'NA'
	end as Employee_Nivel
    from employee
    order by salary desc;
    

#Exemplo NPS
/*    
select response_id,
	case
		when nps <= 6 then 'Detrator'
        when nps <= 8 then 'Passivo'
		else 'Promoter'
	end as NPS
    from table_name;
    */
select Fname, Sex,
	case
		when Sex = 'm' then 'Masculino'
		when Sex = 'f' then 'Feminino'
		else Sex
		end as Gender
    from employee;
    
select count(*) as Quantidade,
	case 
		when Sex = 'm' then 'Masculino'
		when Sex = 'f' then 'Feminino'
		else Sex
		end as Gender
    from employee
    group by Gender;
    
    select * from employee;
    