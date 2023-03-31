#Case statement

use company;
select concat(Fname, " ", Lname), salary, dno from employee;
update employee set salary = 
			case 
				when Dno = 5 then salary + 2000
                when Dno = 4 then salary + 1500
                when Dno = 1 then salary + 3000
                else salary + 0
			end;
            
select * from employee;

#Join Statement
desc works_on;
#Mesma situação
select * from employee, works_on where Ssn = Essn;
select * from employee join works_on on Ssn = Essn;


#Join on = inner join on 
select * from employee join departament on Ssn = Mgr_ssn;

select concat(Fname, " ", Lname), Address 
		from employee join departament on Dno = Dnumber
		where Dname = 'Research';

select * from departament;

select Dname, Dept_create_date, Dlocation
		from departament join dept_locations using (Dnumber)
        order by Dept_create_date;
        
#Cross join -> Produto cartesiano
select * from employee cross join dependent;