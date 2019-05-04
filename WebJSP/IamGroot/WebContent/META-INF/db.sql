CREATE TABLE copyemp
AS SELECT * FROM emp;

alter table copyemp
add constraint pk_copyemp_empno primary key(empno);

create table adminlist(
userid varchar2(20) not null,
pwd varchar2(20) not null
);

insert into adminlist values('admin', '1004');
insert into adminlist values('adminkim', '1234');

create table empface (
 empno number(5),
 url varchar2(50)
);

alter table empface
add constraint fk_empface_empno foreign key(empno) references copyemp(empno) ON DELETE CASCADE;

insert into empface(empno)
select empno from copyemp;
commit;