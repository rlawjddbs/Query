create view test_view as (select * from emp);
-- view�� �����Ϸ��� ������ ������ ���� ��������
-- view ���� ������ �ο��ؾ� �Ѵ�.
-- grant create view to ������;

-- �ܼ� view(���̺� �ϳ��� ������� view) �����غ���
-- create view ��� as (select ... from ...);
create view emp_view as (select * from cp_emp3);


select * from user_views;
select * from cp_emp3;

-- view DML
insert into emp_view(empno, ename, deptno, job, sal) values(1234, '������', 20, '����', 4000);
commit;
-- view�� insert ������ ���� ���̺� �ݿ� ��.
select * from cp_emp3;

update emp_view
set		 job='����', sal=4100
where	 empno=1234;

delete from emp_view where empno = 1234;
commit;

-- view ����
drop view emp_view;
select * from user_views;

-- �ܼ�view (�ϳ��� ���̺� ��� �÷����� view ����)
-- cp_emp3 ���̺��� �����ȣ, �����, ����, �������� view ����
create view emp_view as (select empno, ename, job, sal from cp_emp3);

select * from user_views;

-- view�� ���Ե��� ���� �÷��� insert�� �����ϸ� null�� �Էµȴ�.
insert into emp_view(empno, ename, job, sal) values(1234, '������', '����', 4100);



select * from emp_view;
select * from cp_emp3;

-- ���� view : ���̺� �������� ����Ͽ� ������ view, ��ȸ�� �� �Լ��� ����Ͽ� ��ȸ�� ����� ������ view
-- ���� view�� insert, update, delete�� ������� �ʴ´�.
-- �������� ���̺��� ������ �ܼ� select�� ����Ͽ� ��ȸ �� ��,
create view 	car_view as
	(select 	cma.maker, cma.model, cmo.car_year, cmo.price, cmo.cc, cmo.car_option
	from		car_maker cma, car_model cmo
	where		cmo.model = cma.model);

select * from user_views;
-- view�� ����ϸ� join�� ����� �ܼ� ������ ���� �� �ִ�.
select		maker, model, car_year, price, cc, car_option
from		car_view
where		maker='����';

-- ���� view�� insert, update, delete �� �� ����.
insert into car_view(maker, model, car_year, price, cc, car_option) values('����', '���ν���', 2017, 300, 1999, '��¦3��, ABS');

-- �ܼ� view�� insert, update, delete ����
-- view ������ with read only �� �ٿ��ش�.
create view read_emp as
	(select * from CP_EMP2) with read only;

select * from user_views;
-- with read only �ɼ��� ����� view�� �߰�, ����, ������ �� �� ����.
insert into read_emp(empno, ename, hiredate, sal) values(1234, '������', sysdate, 5000);
