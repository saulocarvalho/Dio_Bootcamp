use mysql;
show tables;
select * from user;

create user 'geral'@localhost identified by '123456';
grant all privileges on testuser.* to 'geral'@localhost;


use testuser;
show tables;