-- ���̺� ���� :
-- ������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ �Ͽ�
-- ��ȸ�� ����� CP_EMP��� ���̺��� ������ ��.

create table cp_emp as ( select empno, ename, hiredate, sal from emp );

-- cp_emp ���̺��� sal �÷��� ���� null�� ������� �ʰ� ����
alter table cp_emp modify sal number(7, 2) not null;
select * from user_constraints;

-- not null ������ �ܵ����� �����Ǿ� �ִٸ� ���������� �̿��Ͽ� �����Ͽ��� �� ����ȴ�.

-- cp_emp ���̺� �����ȣ�� 7500 ~ 7599 ���̿� ����
-- ����� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ�
-- cp_emp2 ���̺��� �����ϰ� �Է��ϼ���.

create table cp_emp2 as (select			*
								from			cp_emp
								where			empno between 7500 and 7599 );


-- ������ ���� (���ڵ带 ��ȸ���� �ʰ� ���������� ����)
-- ��� ���̺��� �����ȣ, �����, �μ���ȣ, ����, ������ ���ڵ尡 ��ȸ���� �ʵ��� ��ȸ

-- 1������ �����ȣ�� ���� ����� ���ٰ�� ������ �� ���� ������ �Ʒ� �ڵ�� �ӽù����� �ڵ�
select			empno, ename, deptno, job, sal
from			emp
where			empno<1;

-- where ������ 1=0 �� ���� �ݵ�� false�� ������ ������ �ٿ� ��ȸ�ϸ� ���ڵ� ���� ���̺��� ������ ��ȸ�� �� �ִ�.
-- �̷��� ������ ���� ���̳��� ����(���� ����)�� �θ���.
create table cp_emp3 as (select			empno, ename, deptno, job, sal
								from			emp
								where			1=0);

select * from cp_emp;
select * from cp_emp2;
select * from cp_emp3;
