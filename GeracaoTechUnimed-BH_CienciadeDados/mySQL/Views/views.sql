show databases;
use company;
show tables;
create or replace view v_today (today) as select current_date();
select * from v_today;