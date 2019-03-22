-- �÷��� �ٿ� ���ڿ��� ��� : //
-- EMP���̺��� �����ȣ, �����, ������ ��ȸ
-- ��������� : �����(�����ȣ)�� xxx�����Դϴ�.
-- alias�� "�� ��� �ο��ϸ� ��ҹ��ڰ� ������ �÷��� ���´�.
select         ename || '('|| empno ||')�� ' || job ||' ���� �Դϴ�.' as output
from			emp;

-- alias�� �ٷ� �Ʒ� where ������ ����� �� ����. - error
select		empno, ename, sal s
from		emp
where		s < 3000;

-- ��� ������ : +, -, *, /
-- ��� ���̺��� �����ȣ, �����, ����, ������ ��ȸ
-- ��, ������ ������ 3.3% ����Ͽ� ���, �����ȣ�� ���� ��ȣ�� 10�� ���� ������ ���.
select		empno, empno+10 as new_empno, ename, sal, sal * 0.033 as tax
from		emp;


-- �÷����� ���� (empno�÷� - mgr�÷�)
select		empno - mgr
from		emp;
-- null�� ����Ǹ� ����� null�� ���´�.
-- ��� ���̺��� �����ȣ, ����, ���ʽ�, �� ���ɾ��� ��ȸ
-- ��, �� ���ɾ��� ������ ���ʽ��� �ջ��� �ݾ����� ��ȸ
-- nvl �Լ��� ����ϸ� null �� ���ڿ��� ������ �� �ִ�.
select		empno, sal, comm, sal+nvl(comm, 0) as total
from		emp;

-- ���� ������ : mod(�÷���, ���� ��) �Լ� ���
-- dual ���̺� : ��� �������� ����� �� �ִ� ���� ���̺�
--					�ԷµǴ� ������ �÷��� �����Ͽ� ��ȸó��

select '������' name, mod(11, 3), mod(1989, 12)
from dual;
-- mod(11, 3)�� 11/3 �� ������ 11�� 3���� ������ �������� 2�� �ȴ�.
-- mod(1989, 12)�� 1989/12 �� ������ 1989�� 12�� ������ �������� 9�� �ȴ�.
-- (�¾ �� / 12 ) = 0~11 �� ���� ����
-- 11:��, 10:��, 9:��, 8:��, 7:�䳢, 6:ȣ����, 5:��, 4:��, 3:����, 2:��, 1:��, 0:������

-- ��ȸ�ϴ� �÷��� ���迬���ڸ� ����ϸ� Error
select		sal > 300
from		emp;

-- ���迬����(�񱳿�����) : where��, having������ ���ȴ�.
-- ���� : >, <, >=, <=, =, !=, (<>)

-- ������̺��� ������ 3000���� �۰ų� ���� ����� �����ȣ, �����, �Ŵ�����ȣ, ����, �Ի���, �μ���ȣ ��ȸ
select		empno, ename, mgr, sal, hiredate, deptno
from 		emp
where    sal <= 3000;

-- ������̺��� ������ 3000 �̻��� ����� �����ȣ, �����, �Ŵ�����ȣ, ����, �Ի���, �μ���ȣ ��ȸ
select		empno, ename, mgr, sal, hiredate, deptno
from		emp
where		sal >= 3000;

-- ��� ���̺��� �μ���ȣ�� '30'���� ������� �����ȣ, �����, ����, �Ի���, �μ���ȣ ��ȸ
select empno, ename, job, hiredate,deptno
from	emp
where	deptno=30;

-- ��� ���̺��� �μ���ȣ�� '20'���� �ƴ� ������� �����ȣ, �μ���ȣ, �����, ������ ��ȸ
select		empno, deptno, ename, job
from		emp
where		deptno <> 20;
-- <> : ������������ != �� ������ ��

-- ������̺��� ���ʽ��� ���� ����� �����ȣ, �����, ����, ���ʽ� �� ��ȸ
-- null�� ���迬���ڷ� ���� �� ����
-- is null, is not null �� ��ȸ
select		empno, ename, sal, comm
from		emp
where		comm is null or comm = 0;
-- �ݴ��� ��� comm is not null;

-- �������� : and (��� �� ������ �´� ���ڵ带 ��ȸ), or (�����ǿ� �ش��ϴ� ��� ���ڵ带 ��ȸ), not

-- ������̺��� �����ȣ�� 7369 �̸鼭 ������ 'clerk'�� ����� �����ȣ, �����, ����, �Ի���, ������ ��ȸ
select			empno, ename, job, hiredate, sal
from 			emp
where			empno=7369 and job='clerk';
-- ����Ŭ�� ���� ���ؼ��� ��,�ҹ��ڸ� �����ϹǷ� '��Ȯ�Ѱ�' �� �Է��� ��.
select			empno, ename, job, hiredate, sal
from 			emp
where			empno=7369 and job='CLERK';

-- ������̺��� ������ 1500 �̻� 3000 ������ ������� �����ȣ, �����, ����, �Ի���, ���� ��ȸ

select			empno, ename, job, hiredate, sal
from			emp
where			sal>=1500 and sal<=3000;

-- ������ �˻��������� ����� ������ between �� ����� �� �ִ�.
-- ����) �÷��� between ������ and ū��

select			empno, ename, job, hiredate, sal
from			emp
where			sal between 1500 and 3000;

-- ��� ���̺��� 7902, 7839, 7566 �Ŵ����� ������ �޴� ����� �����ȣ, �����, �Ŵ�����ȣ, ����, �Ի����� ��ȸ
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr=7902 or mgr=7839	or mgr=7566;
-- or �� in ���� �ٲ� ����� �� �ִ�.
-- ����) �÷��� in (��1, ��2, ��3 ...)
-- in�� "�����ϴ� ..." �̶�� ��
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr in (7902, 7839, 7566);
--  not int�� "�������� �ʴ�..." �̶�� ��
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr not in (7902, 7839, 7566);
select * from EMP;

