use company;
###Teste
select Fname, count(*) from employee inner join departament on dno = Dnumber;

select count(Pname) from project;
select Dname, Pname, count(*) from project inner join departament on Dnumber = Dnum
group by Pname;

select Pname, Dname, count(Pname) as t from employee inner join departament on dno = Dnumber
inner join project on dnum = dnumber
group by Pname;

select Dname, count(*) from departament inner join project on Dnum = Dnumber
inner join employee on Dnum = dno
group by Dname;

select Fname, Dname from employee inner join departament on dno = Dnumber
inner join project on Dnum = Dnumber
group by Pname;
###

