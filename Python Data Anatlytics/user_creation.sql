show databases;
use company;
show tables;
show privileges;
#Criar usuário
CREATE USER 'powerbi'@'localhost'
identified by 'powerbi';
#Remover permissões
revoke all privileges, grant option 
from 'powerbi'@'localhost';
#Dar todas permissões
grant all privileges
on company.*
to 'powerbi'@'localhost';
#Dar permissões especificas para toda tabela
grant select, update, insert, delete, create, alter, create view
on company.*
to 'powerbi'@'localhost';
#Dar permissão para uma table especifica
grant drop
on company.test
to 'powerbi'@'localhost';


