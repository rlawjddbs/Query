create table trigger1(
	name varchar2(30),
	age number(3),
	addr varchar2(100)
);

create table trigger2(
	name varchar2(30),
	age number(3)
);


--- trigger ����
drop trigger test_trigger;
select * from user_triggers;

select * from test_trigger;

select * from trigger1;
select * from trigger2;

insert into trigger1(name, age, addr) values('������', 27, '��õ�� ������');
insert into trigger1(name, age) values('������', 27);

commit;

update 			trigger1
set					name='���ü�', age=26
where				name='������';

delete from trigger1 where name='������';

select * from trigger2;
select * from trigger1;

select * from user_triggers;

drop trigger event_compare;


insert into class4_info(num, age) values(99, 46);
commit;



select * from trigger2;


select * from cp_emp3;
select * from cp_emp;
select * from emp;

insert into cp_emp(empno, ename, hiredate, sal) values(7777, 'pandaman', sysdate, 3000);

delete from cp_emp where empno=7777;
delete from cp_emp3 where empno=7777;    

------- �������� �׽�Ʈ -----------

