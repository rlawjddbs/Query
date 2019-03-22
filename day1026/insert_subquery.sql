-- insert subquery

-- �ܼ���
-- cp_emp3�� �Ʒ��� ���� ���ڵ带 �߰�
-- �����ȣ: 1111, �����: ����ö, �μ���ȣ: 10, ����: ���, ����: emp���̺��� �����ȣ�� 7566�� ����� ������ ���� ����

-- ���� ���
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '����ö', 10, '���', 2975);
-- subquery Ȱ�� ���
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '����ö', 10, '���', (select sal from EMP where empno=7566));



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- �� insert subquery �� ������ ���������� ���� �ϴ� ������ �������� ���Ǹ� error �� �߻��Ѵ�.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '����ö', 10, '���', (select sal from EMP));
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '����ö', 10, '���', (select sal, deptno from EMP where empno=7566));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- ������(������) subquery
-- emp ���̺��� �μ���ȣ�� 30���� �μ��� �����ȣ, �����, �μ���ȣ, ����, ������ ��ȸ�Ͽ� cp_emp3 ���̺� �߰��Ѵ�.
insert into cp_emp3(select empno, ename, deptno, job, sal from emp where deptno=30);

------------------------------------------------------------------------------------------------------------------------------------------------------
-- ������̺��� 1981-02�� �Ի��� ����� ����, ������, �Ի��-��, �Է����� test ���̺� �߰��Ѵ�.
create table test(
	job		varchar2(9),
	sal			number(7,2),
	hiredate	date
);
-- �÷��߰�
alter table test add input_date date;
-- ���� �÷� ����
alter table test modify hiredate varchar2(7);

--select 			job, sal, to_char(hiredate,'yyyy-mm') as hiredate
--from				emp
--where				to_char(hiredate,'yyyy-mm')='1981-02';

insert into test
	 (select job, sum(sal), to_char(hiredate, 'yyyy-mm') hiredate, sysdate
	 from emp
	 where to_char(hiredate, 'yyyy-mm')='1981-02'
	 group by job, hiredate);

select * from test;
select * from EMP;
select * from CP_EMP3;
