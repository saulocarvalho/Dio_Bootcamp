#Union, Except and Intersect
create database teste;
use teste;

create table R(A char (2));

create table S(A char(2));

insert into R(A) values ('a1'),('a2'),('a2'),('a3');
insert into S(A) values ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

select * from R;
select * from S;

#Except = not in 
select * from S where A not in (select A from R);

#Union = union = não repete valores
select distinct S.A from S;
(select distinct R.A from R) union (select distinct S.A from S);

#Intersect 
select distinct R.A from R where R.A in (select S.A from S)
#distinct = faz não repetir valores