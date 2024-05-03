#create database company_desafio;
use company_desafio;
show tables;
#drop database company_desafio;
create table employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null,  #char obriga a ter o número completo definido
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10, 2),
    Super_ssn char (9),
    Dno int not null,
    constraint pk_employee primary key (Ssn)
);
alter table employee
	add constraint fk_employee
    foreign key (Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;
alter table employee modify Dno int not null default 1;

desc employee;
create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
	Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique (Dname),
    foreign key (Mgr_ssn) references employee (Ssn)
);
#modificando constraint: drop e add
alter table departament add constraint fk_dept foreign key (Mgr_ssn)
	references employee(Ssn) on update cascade;

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar (15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);
create table project(
	Pname varchar (15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament (Dnumber)
);
create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_project_works_on foreign key (Pno) references project (Pnumber),
    constraint fk_employee_works_on foreign key (Essn) references employee (Ssn)
);
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    Age int not null,
    constraint chk_age_dependent check (Age < 22),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee (Ssn)
);


show tables;
desc employee;
desc works_on;

select * from information_schema.table_constraints
	where constraint_schema = 'company';

select * from information_schema.referential_constraints
	where constraint_schema = 'company';