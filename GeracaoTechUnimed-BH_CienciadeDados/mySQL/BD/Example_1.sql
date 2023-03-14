show databases;
create database first_exemple;
use first_exemple;
CREATE TABLE person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('F', 'M'),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key(person_id, food),
    constraint fk_favorite_food_person  foreign key (person_id)
    references person(person_id)
);
desc favorite_food;
show databases;
desc information_schema.table_constraints;
select * from information_schema.table_constraints
where constraint_schema = 'first_exemple';

show databases;
use first_exemple;
desc person;

insert into person values 	('1', 'Emanuel', 'Carvalho', 'M', '2000-03-01',
							'rua aaa', 'Maceió', 'AL', 'Brazil', '57050-000'),
							('2', 'Paulinho', 'Carvalho', 'M', '2000-03-01',
							'rua aaa', 'Maceió', 'AL', 'Brazil', '57050-000');

select * from person;

delete from person where person_id = 2;

desc favorite_food;

insert into favorite_food values 	('0', 'lasanha'),
									('1', 'churrasco');
                                    
select * from favorite_food;

