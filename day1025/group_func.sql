-- �����Լ� - �÷��� ���� �ϳ��� ����� ��ȯ�ϴ� �Լ���
-- count : null�� �ƴ� �÷��� ������ �� ��
-- ��� ���̺��� ���ڵ� �� (��� ��), ���ʽ��� �����ϴ� ��� ��

-- �����
select		count(empno)
from		emp;
-- ������� ���ʽ��� �����ϴ� ��� ��1
select		count(empno), count(comm)
from		emp;
-- ������� ���ʽ��� �����ϴ� ��� ��2
select		count(empno) "�����", count(comm)"���ʽ� �޴� �����"
from		emp;
-- ������� ���ʽ��� �����ϴ� ��� �� �� ���ʽ��� �������� ���ϴ� ��� ��
select		count(empno), count(comm),
			count(empno) - count(comm)
from		emp;
-- ������� ���ʽ��� �����ϴ� ��� �� �� ���ʽ��� �������� ���ϴ� ��� �� �� �Ŵ����� �ִ� ��� ��
 select	count(empno), count(comm),
			count(empno) - count(comm), count(mgr)
from		emp;

-- ������� ������ ��, ���ʽ� ��, �ΰǺ� ����
select 	sum(sal), sum(comm), sum(sal)+sum(comm)
from	    emp;

-- ���� ���
select		avg(sal)
from		emp;
-- ���� ��� �Ҽ��� ���ֱ�
select		trunc(avg(sal),0)
from		emp;
-- ���� ��� ���ʽ� ���
select		trunc(avg(sal), 0), avg(comm)
from		emp;

-- �ְ� ������
select		max(sal)
from		emp;
-- ���� ������
select		min(sal)
from		emp;

-- �ְ� ������, ����������, �ְ����װ� ���������� ��
select		max(sal), min(sal), max(sal) - min(sal)
from		emp;

-- ** where �� ������ �����Լ��� ����� �� ����. (�������� ������ ��, �� ���� ������)
-- ��� ���̺��� ��տ������� ���� �����ϴ� ����� �����ȣ,
-- �����, ����, �Ի��� ��ȸ (�������� ��� ����δ� �� ��)
-- �õ�1
select		empno, ename, sal, hiredate
from		emp
where		sal > avg(sal);

-- �����Լ��� group by�� ���� ����ϸ� �׷캰 ���踦 ��ȸ�� �� �ִ�.
-- �μ���ȣ, �μ��� �ο� ��, �μ��� ���� ��, �μ��� ���� ���(�Ҽ��� ���� �� �ڸ�), �ְ� ������, ���� ������ ��ȸ
select				deptno, count(empno), sum(sal), trunc(avg(sal), 2), max(sal), min(sal)
from		        emp
group by			deptno
order by			deptno asc;

-- ��� ���̺��� �Ŵ����� ���� �ο���, �ְ����� ��������
-- �ְ� ������ �������� ����
-- �� �Ŵ����� �ִ� ����鸸 ��ȸ�� ��
select			mgr, count(empno), max(sal), min(sal), max(sal) - min(sal)
from			emp
where			mgr is not null
group by		mgr
order by		mgr asc;

-- ��¥ �Լ�
-- ���÷κ��� 5�� �� ��¥ ��ȸ
-- ��¥�� +�� ����ϸ� �� �� ���Ѵ�.
select		sysdate+5
from		dual;

-- 7���� �� ��¥
select		add_Months(sysdate, 7)
from		dual;

-- ���� ��¥�� ���� ��¥�� ��
select		months_between('2018-11-25', sysdate)
from		dual;


select * from EMP;
