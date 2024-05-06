select concat(Fname, " ", Lname) as Nome, Pname, Pno, hours from employee inner join works_on on ssn = essn
inner join project on pno = pnumber
where hours < 10;


select concat(Fname, " ", Lname) as Nome, Pname, hours from employee inner join works_on on ssn = essn
inner join project on pno = pnumber
order by nome;

#select concat(Fname, " ", Lname) as Nome, ssn, Mgr_ssn, Dname from employee inner join departament on dno = Dnumber;
select concat(m.Fname, " ", m.Minit, " ", m.Lname) as FullName_Manager, m.ssn, concat(e.Fname, " ", e.Minit, " ", e.Lname) as FullName_Employee, e.super_ssn, Dname  from employee m inner join departament on dno = dnumber
inner join employee e on m.ssn = e.super_ssn;


select concat(m.Fname, " ", m.Minit, " ", m.Lname) as FullName_Manager, m.ssn, count(e.Fname) as Quantity_Employees  from employee m inner join departament on dno = dnumber
inner join employee e on m.ssn = e.super_ssn
group by 2;
	
