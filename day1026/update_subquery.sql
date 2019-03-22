-- update subquery : �ٸ� ���̺��� ���� �����Ͽ� ���� ���̺��� ���� ������ ��
-- �ܼ���(����)
-- cp_emp3 ���̺��� �����ȣ�� '1111'�� ����� ������
-- emp���̺��� �����ȣ�� '7788'�� ����� �������� ����

update cp_emp3
set	sal=(select			sal
		  from			emp
		  where			empno=7788)
where empno=1111;

select * from cp_EMP3;
select * from emp;

-- �ܼ��� subquery�� �������� �߻��ϸ� error �߻�
-- �÷��� ������ ��ȸ�ϸ� error �� �߻��Ѵ�.
update cp_emp3
set	sal=(select			sal
		  from			emp)
where empno=1111;

update cp_emp3
set	sal=(select			sal,dept
		  from			emp
		  where=7788)
where empno=1111;

-- ������ subquery�� in�� ����Ͽ� where ���� ��� (�������� ����)
insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222, '�׽�Ʈ', 30, 'SALESMAN', 2000);
commit;
-- cp_emp3 ���̺��� emp ���̺��� �μ���ȣ�� 30���� ��� ������� ������ '1000'���� ����
update 	 cp_emp3
set			 sal=1000
where      empno in (select	empno from	cp_emp3 where	deptno=30);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- delete subquery
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- �ٸ� ���̺��� ���� �����Ͽ� ���� ���̺� ���ڵ� ����.
-- �ܼ���
update		cp_emp3
set				ename='���ī'
where			empno=7698;
commit;
-- cp_emp ���̺��� ��������� ����.
-- ���� ���� : emp ���̺��� ������� 'blake'�� ����� �����ȣ
-- ���� ����� cp_emp3 ���̺��� ����
delete from cp_emp3
where empno=(select empno from emp where ename='BLAKE');

-- ������:
-- cp_emp3 ���̺��� emp ���̺��� �μ���ȣ�� 30���� ��� ������ �����ȣ�� ���� ����� ����
delete from	cp_emp3
where empno in (select	empno from emp where deptno=30);

select * from cp_emp3;

-- select subquery
-- �ܼ��� :
-- scalar subquery(��Į�� ��������) : select�� ��ȸ�ϴ� �÷��� subquery�� ����ϴ� ��.
--  emp ���̺��� �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ
-- �μ����� dept ���̺� ����

-- ���� �̸��� �÷��� �����ϸ� � ���̺� �����ϴ� �÷����� �����Ͽ� ����ؾ� �Ѵ�. (���̺��.�÷���)
-- ���б�ȣ�� ��ħǥ "." �� ����Ѵ�.
select empno, ename, deptno, (select dname from dept where dept.deptno=emp.deptno)
from emp;
-- �ڵ�Ǯ��
-- emp ���̺��� �����ȣ, �����, �μ���ȣ, (�μ���)�� ��ȸ�Ѵ�.
-- �̶� �μ����� dept ���̺� �ִ� dname �÷����� deptno ��ȣ�� emp ���̺��� deptno ��ȣ�� ��ġ�ϴ� ���� �����´�.
-- emp ���̺�� dept ���̺��� deptno �÷����� ��ġ�ϹǷ� ���� ���̺��.deptno �� �Է��Ͽ� � ���̺� �����ϴ� �÷����� �����Ͽ�
-- �ڵ带 �ۼ��ؾ� �Ѵ�.

-- cp_emp3 ���̺� emp ���̺��� ��� ��� �� �μ���ȣ�� 10��, 30���� ������� �����ȣ, �����, �μ���ȣ, ����, ���� ����
insert into cp_emp3(
select empno, ename, deptno, job, sal from emp where deptno in(10, 30)
);
commit;



-- ������̺��� �����ȣ�� '7698'�� ����� �μ���ȣ�� ���� �μ���ȣ�� ���� �������� cp_emp3 ���̺��� ��ȸ,
-- ��ȸ �÷��� �����ȣ, �����, �μ���ȣ, ���� ��ȸ.
select		    empno, ename, deptno, job
from			cp_emp3
where			deptno=(select deptno from emp where empno=7698);

-- where ���� ����� ������ �Ǹ� error �߻�
select		    empno, ename, deptno, job
from			cp_emp3
where			deptno=(select deptno from emp where empno in (7698, 7566));

-- �÷����� ������ subquery in, any, all, exists
-- ������̺��� �����ȣ�� '7698','7782'�� ����� �μ���ȣ�� ���� �μ���ȣ�� ���� �������� cp_emp3 ���̺��� ��ȸ,
-- ��ȸ �÷��� �����ȣ, �����, �μ���ȣ, ���� ��ȸ.
select			empno, ename, deptno, job
from			cp_emp3
where			deptno in (select deptno from emp where empno=7698 or empno=7782);

select			empno, ename, deptno, job
from			cp_emp3
where			deptno in (select deptno from emp where empno in (7698, 7782));

-- �ܺΰ� �Է¹ޱ�(������Ʈ�� ����ڰ� ���� �˻� ������ ��) :
-- �������� &������(���������) : prompt(�Է�â�� ���۵�, �Է�â ���´� ������ �ٸ�, �Է�â�� �Է��� ���� ������ ���� ��)
-- &�������� �������� �״�� ���ԵǹǷ� ���ڿ��� �Է��� ��� ����ǥ ' �� �����־�� ������ �߻����� �ʴ´�.
-- ���ڿ��� �˻��� ��� ����ǥ�� �ٿ���� ��.
select * from emp where deptno=&deptno;
select * from emp where ename='&ename';

-- exists : ���������� ���� �����Ѵٸ� �� ���  ���� �������� �������� �ٱ������� �����Ѵ�.
-- ������̺��� ����ڰ� �Է��� ���� ���̺� �� �μ���ȣ�� ��ġ�Ѵٸ� emp ���̺��� ��� �����ȣ, �����, �Ի���, �μ���ȣ�� ��ȸ
select empno, ename, hiredate, deptno
from	emp
where exists (select deptno from emp where deptno=&deptno);
-- exists �� ������ �����Ǹ� �ٱ����� ������ �����Ѵ�. (�Է°��� ��ġ�ϴ� �׸� ��ȸ �ϴ� ������ �ƴ�)

-- ����ڰ� �Է��� ���� ��ġ�ϴ� �׸��� �����ȣ, �����, �Ի���, �μ���ȣ �� ��ȸ�Ϸ���
select empno, ename, hiredate, deptno
from	emp
where deptno=&deptno;

-- all : and�� ���� - <: ���������� ��ȸ�� �� �� ���� ���� ������ �� ����
--						>:	������������ ��ȸ�� �� �� ���� ū ������ �� ����

-- �Էµ� �μ����� ���� ������ ���� �������, ������ �� ���� ����� ��ȸ�Ѵ�.
select empno, ename, sal, deptno
from	emp
where	sal < all (select sal from EMP where deptno=10);

select empno, ename, sal, deptno
from	emp
where	sal < all (select sal from EMP where deptno=&d_no);

--any : or
select empno, ename, sal, deptno
from emp
where sal < any (select sal from EMP where deptno=10);

select sal from EMP where deptno=10;

------------------------------------------------------------------------------------------------------------------------------------------
-- rownum : ��ȸ�� ����� �������� ��ȣ�� ���̴� ���� �÷�
------------------------------------------------------------------------------------------------------------------------------------------
-- ��ȣ, �����ȣ, �����, �Ի��� ��ȸ
-- ��, ��ȣ�� ��ȸ����� 1���� ���������� �ο��Ǿ�� �Ѵ�.
select		rownum, empno, ename, hiredate
from		emp;

select		rownum, empno, ename, hiredate
from		emp
where		deptno in (10, 20);

-- order by �� ���� ���Ǹ� rownum �� ��ȣ�� ���� �ο��� �� order by �� ���� ���ĵǹǷ�
-- ��ȣ�� ���̰� �ȴ�.
select		rownum empno, ename
from		emp
order by	ename asc;


-- rownum�� where ������ ����ϸ� 1�����ʹ� ��ȸ�� �ǳ�
-- 1���� �ƴ� ��ȣ�� ��ȸ���� �ʴ´�.
-- ������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ�Ѵ�.
-- ��, ����� ��ȸ ������ 1�� ~ 5�� ������ ����Ѵ�.
select 	rownum, empno, ename, hiredate, sal
from		emp
where		rownum between 1 and 5;

-- rownum�� where ������ ����ϸ� 1�����ʹ� ��ȸ�� ������ 1���� �ƴ� ��ȣ�� ���ϸ� ��ȸ���� �ʴ´�.
select 	rownum, empno, ename, hiredate, sal
from		emp
where		rownum between 2 and 5;

-- ������ ��������
-- ��ȸ���(inline view)�� ������ �� ��ȸ
/*
	... from (select	�÷���...
	from	(select ... ))
*/
-- ��ȸ����� ������ �� ��ȸ�ϴ� ����̱� ������ ������ ��ȸ���� �������� ���� ���� ��ȸ�� �� ����.
select empno, ename, sal, hiredate, comm
from	(select empno, ename, sal, hiredate from emp);
-- �ٸ�� alias �� ������ �÷����� �� ��ȸ�� �ٸ�� ������ ��ȸ�ؾ� �Ѵ�.
select empno, ename, sal, hiredate
from	(select empno, ename, sal, hiredate as hi from emp); /* error*/

select empno, ename, sal, hi
from	(select empno, ename, sal, hiredate as hi from emp); /* search sucess */

select rownum empno, ename, sal, hi
from	(select rownum empno, ename, sal, hiredate as hi from emp order by sal);

select rownum, empno, ename, sal, hi
from	(select rownum empno, ename, sal, hiredate as hi from emp order by sal);

-- ��� ���̺��� ���� �������� �Ի��� ������� 5�� ��ȸ
-- ��ȸ�� �÷��� �����ȣ, �����, �Ի���
-- ���� Ǭ ��
select	rownum, empno, ename, hiredate
from (select		empno, ename, hiredate
		from		emp
		order by hiredate desc)
where rownum between 1 and 5
order by hiredate desc;
-- Ǯ�� �� ��
select rownum, empno, ename, hiredate
from (select	empno, ename, hiredate
		from	emp
		order by hiredate desc)
where rownum between 1 and 5;

-- ������̺��� ���� �������� �Ի��� ����� ���� �Ի������ 5�� ��ȸ
-- ��ȸ�� �÷��� �����ȣ, �����, �Ի���
-- ���� Ǭ ��
select rownum ranking, empno, ename, hiredate
from(
		select rownum as rank, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
		where rownum between 1 and 6
)
where rank between 2 and 6;
-- �������� �� 3�� ���
-- �ٸ��(alias) Ȱ��


-- Ǯ�� �� ��
select rownum, r, empno, ename, hiredate
from(
		select rownum r, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
)
where r between 2 and 6;
-- �� -�� -�� ������ hiredate ǥ�� �ٲٱ�
select rownum, r, empno, ename, to_char(hiredate, 'mm-dd-yyyy') as hiredate
from(
		select rownum r, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
)
where r between 2 and 6;

select * from user_constraints; /* ��������� ����ڸ��� �ٸ� �� ����.*/

select * from dept;
select * from emp;
select * from cp_emp3;
