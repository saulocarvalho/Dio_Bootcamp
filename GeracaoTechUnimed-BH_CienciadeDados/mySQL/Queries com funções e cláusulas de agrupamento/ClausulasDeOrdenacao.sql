#Clásulas de ordenação 
use company;
select * from employee order by Fname;

#Nome do departamento, nome do gerente do departamento 
select distinct d.Dname, concat(e.Fname, " ",e.Lname) as Manager from departament d, employee e, works_on w, project p
		where d.Dnumber = e.Dno and e.SSn = d.Mgr_ssn and w.Pno = p.Pnumber
        order by d.Dname;

#Recupera os empregados e projetos que estão sendo trabalhados        
select distinct d.Dname, concat(e.Fname, " ",e.Lname) as Employee, p.Pname
		from departament d, employee e, project p, works_on w
        where d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber
        order by d.Dname desc;
#desc = descendente asc = ascendente 

