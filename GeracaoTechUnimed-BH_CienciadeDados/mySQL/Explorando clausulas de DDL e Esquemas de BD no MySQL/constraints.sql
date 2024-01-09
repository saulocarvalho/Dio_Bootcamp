show databases;
use sys;
show tables;
show tables like 'schema%';

select * from schema_auto_increment_columns;
select * from schema_index_statistics;

select * from sys.host_summary_by_file_io;
select * from sys.host_summary;

show create view sys.session;

show tables like '%list';
select * from sys.processlist;
select * from sys.session;

#Information schema
show databases;
use information_schema;
show tables; 
select * from information_schema.keywords;
select * from information_schema.tables where table_schema='company';
select * from information_schema.check_constraints;
select * from information_schema.referential_constraints where constraint_schema = 'company';