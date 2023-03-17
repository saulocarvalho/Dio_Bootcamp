SHOW DATABASES;
DROP DATABASE firstexample;
CREATE DATABASE first_example;
USE first_example;
SHOW TABLES;
CREATE TABLE person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('M', 'F'),
	birth_date date,
	street varchar(30),
	city varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key(person_id, food),
    constraint fk_favorite_food_person_id foreign key(person_id)
    references person(person_id)
    );
 desc favorite_food;   
 show databases;
 select * from information_schema.table_constraints
 where constraint_schema = 'first_example';
 
 desc information_schema.table_constraints;
 select * from information_schema.table_constraints
 where table_name = 'person';

desc person;
insert into person values('0', 'Saulo', 'Carvalho', 'M', '2000-03-01',
						'Rua etc', 'Cidade M', 'Brazil', '57025');
select * from person;

delete from person where person_id= 1 or person_id = 3;

select * from person;

desc favorite_food;

insert into favorite_food values ('0','cupim'),
								('0', 'macarronada');

select * from favorite_food;