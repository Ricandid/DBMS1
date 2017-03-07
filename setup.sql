set echo on
connect system/yopanda1617

drop user techvoc_user cascade;
create user techvoc_user identified by pandahead;
grant connect, resource to techvoc_user;
alter user techvoc_user default tablespace users temporary tablespace temp account unlock;

drop user techvoc_teacher cascade;
create user techvoc_teacher identified by pandahead;
grant connect, resource to techvoc_teacher;
alter user techvoc_teacher default tablespace users temporary tablespace temp account unlock;

drop user techvoc_admin cascade;
create user techvoc_admin identified by pandahead;
alter user techvoc_admin default tablespace system temporary tablespace temp account unlock;
grant create procedure, create session, create table, resource, select any dictionary to techvoc_admin; 

connect techvoc_teacher/pandahead;

create table teacher
  (emp_id number(38) primary key,
  first_name varchar2(20),
  last_name varchar2(20),
  m_initial varchar2(20),
  bdate date,
  gender char(6),
  email varchar2(50),
  password varchar2(50));
 

connect techvoc_user/pandahead;

create table student
  (usn number(38) primary key,
  first_name varchar2(20),
  last_name varchar2(20),
  m_initial varchar2(20),
  bdate date,
  gender char(6),
  email varchar2(50),
  password varchar2(30));

connect techvoc_teacher/pandahead;

create table gradingsheet
  (usn number(38) primary key,
  remarks varchar2(50),
  subjects varchar2(50),
  grades varchar2(50));

grant select on gradingsheet to techvoc_user;
grant select on teacher to techvoc_user;
connect techvoc_user/pandahead;
grant select on student to techvoc_teacher;