set echo on
connect system/amakal

--Create PHP Application User
drop phpuser cascade;
ceate phpser identified by welcome;
grant connect, resource to phpuser;
alter user phpuser default tablespace users temporary tablespace temp account unlock;


--Create user owner security info about the application
drop php_sec_admin cascade;
create php_sec_admin identified by welcome;
alter user php_sec_admin default tablespace system temporary tablespace temp account unlock;
grant create procedure, create session, create table, resource, select any dictionary to php_sec_admin;

connect phpuser/welcome;

--"Parts" table for the application demo
create table parts
  (id number primary key,
  category varchar2(20),
  name varchar2(20));
 
insert into parts values(1, 'electrical', 'lamp');
insert into parts values(2, 'electrical', 'wire');
insert into parts values(3, 'electrical', 'switch');
insert into parts values(4, 'plumbing', 'pipe');
insert into parts values(5, 'plumbing', 'sink');
insert into parts values(6, 'plumbing', 'toilet');
commit;

connect php_sec_admin/welcome;

--Authentication table with the webuser usernames and password
--A real application would never store plain-text passwords
--but this code is a demo for user of client identifiers and
--not about authentication

create table php_authentication
  (app_username varchar2(20) primary key,
  app_password varchar2(20) not null);
  
 inser into php_authentication values('mirana', 'tiger');
 inser into php_authentication values('luna', 'leopard');
 commit;
 
 grant selection on php_authentication to phpuser;
