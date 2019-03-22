--����
-- 1. ������̺��� �����ȣ, �����, ����, �Ŵ�����ȣ,����,
--    �Ի����� ��ȸ�ϼ���.
--    ��, ������ ������������ �����ϵ�, ������ ���ٸ� �����ȣ��
--    ������������ �����ϼ���.
--    �Ի����� ��-��-���� �������� ����ϼ���.
--    ������ 3�ڸ����� ,�� �־� ����ϼ���.
select empno, ename, job, mgr, to_char(sal,'999,999,999') as sal, to_char(hiredate,'mm-dd-yyyy') as hiredate
from emp
order by sal asc, ename desc;

select		empno, ename, job, mgr, to_char(sal,'999,999,999') sal, to_char(hiredate,'mm-dd-yyyy') hiredate
from			emp
order by 	sal asc, empno desc;

-- 2.  ������̺��� 3,4�б⿡ �Ի��� �������  �μ��� ������,
--     �������, �ְ���, ��������, ������� ��ȸ�Ͽ� �Ʒ��� ���� ����ϼ���.
--     ��¿� )  10���μ� ������� [x]��, ������� : [xx],
--	    �ְ��� [xx], ��������[xx]
-- 		1�б� : 1/2/3 ��
-- 		2�б� : 4/5/6 ��
-- 		3�б� : 7/8/9 ��
-- 		4�б� : 10/11/12 ��
select			deptno||'�� �μ� ������� ['||count(deptno)||']��, �������: ['||avg(sal)||'], �ְ���: ['||max(sal)||'], ��������: ['||min(sal)||']' as salary
from			emp
where			to_char(hiredate, 'mm') between 07 and 12
group by		deptno
order by		deptno asc;

select         deptno||'�� �μ� ������� ['||count(deptno)||']��, �������: ['||avg(sal)||'], �ְ���: ['||max(sal)||'], ��������: ['||min(sal)||']' salary
from			emp
where			to_char(hiredate, 'mm')=07 or to_char(hiredate, 'mm')=08 or to_char(hiredate, 'mm')=09 or to_char(hiredate, 'mm')=10 or to_char(hiredate, 'mm')=11 or to_char(hiredate, 'mm')=12
group by		deptno
order by		deptno asc;
--3. TEST_ORDERBY���̺��� ��ȣ�� ����ϼ���.
--   ��, ��µǴ� ��ȣ��  S_0000000001 ��������
--   10�ڸ��� ���ڰ� �Ǿ���ϸ�, 10�ڸ��� ���� �ʴ� ���ڴ�
--  �տ� 0�� �ٿ� 10�ڸ��� ����� 'S_' �� �ٿ� ����Ѵ�.
select		'S_'||lpad(num, 10, 0) as num
from			test_orderby;

select		'S_'||lpad(num, 10, 0) num
from			test_orderby;

--4. ������̺��� �����, �μ���ȣ, ����,���ʽ�,�Ѽ��ɾ�,
-- �Ի����� ��ȸ�ϼ���.
--   ��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ�����
--   ��ȸ�ϼ���.  ������ ������ 12�� ���� ���� ������ �����Ͽ�
--   ����ϼ���.
select       ename, deptno, sal, nvl(comm, 0) comm, sal+trunc(sal/12, -2)+nvl(comm, 0) total, hiredate
from		   emp;

select		ename, deptno, sal, nvl(comm, 0) as comm, sal+trunc(sal/12, -2)+nvl(comm, 0) as total, hiredate
from			emp;

--5. ��� ���̺��� �μ���ȣ,�μ���,����, ���ʽ�, �μ�Ƽ�긦
--   ��ȸ�ϼ���.
--   �μ�Ƽ���  �Ʒ�ǥ�� ���� �μ����� ���� �����մϴ�.
--   10- ���޿� 100%, 20- ���޿� 150%, 30 - ���޿� 300%, �׿� ���޿� 50%
select		deptno,
				case deptno	when 10	then '������'
									when 20	then '����������'
									when 30	then 'Ź����'
				end as dept,
				sal, nvl(comm, 0) as comm,
				case deptno	when 10	then	sal/12*1
									when 20	then sal/12*1.5
									when 30	then sal/12*3
									else sal/12*0.5
				end as incentive
from			emp;

select		deptno, decode(deptno, 10, '������', 20, '����������', 30, 'Ź����') as dept, sal, nvl(comm, 0) comm, decode(deptno, 10, sal/12*1, 20, sal/12*1.5, 30, sal/12*3, sal/12*0.5) as incentive
from			emp;


--6. class4_info ���̺� �Ʒ��� ���� �����͸� �߰��մϴ�.
--   ��ȣ - 10, �̸� - Ȳ�缺, �ֹι�ȣ - 030101-3234567
--   ��ȣ - 12, �̸� - �ż���, �ֹι�ȣ - 011201-4234567
--   ��ȣ - 13, �̸� - �ڳ���, �ֹι�ȣ - 880101-2234567
--   ��ȣ - 14, �̸� - ��ſ�, �ֹι�ȣ - 880101-2234567
insert into class4_info(num, name, ssn) values(10, 'Ȳ����', '030101-3234567');
insert into class4_info(num, name, ssn) values(12, '�ż���', '011201-4234567');
insert into class4_info(num, name, ssn) values(13, '�ڳ���', '880101-2234567');
insert into class4_info(num, name, ssn) values(14, '��ſ�', '880101-2234567');

--7. class4_info ���̺��� ��ȣ, �̸� , �ֹι�ȣ,
--   ������ ��ȸ �ϼ���.
--   ������ �ֹι�ȣ��   8��° �ڸ��� ���Ѵ�.
--   8��° �ڸ��� 1,3�̸� ����, 2,4�� ���� �׷��� ������ "����"
--   ������Ѵ�.
select        num, name, ssn, decode(substr(ssn, 8, 1), '1', '����', '2', '����', '3', '����', '4', '����', '����') as gen
from			class4_info;

select		num, name, ssn,
				case substr(ssn, 8, 1)	when '1'	then '����'
												when '2'	then '����'
												when '3'	then '����'
												when '4'	then '����'
												else '����'
				end as gen
from			class4_info;

select * from class4_info;
