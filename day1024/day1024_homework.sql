-- day1024_4���� ����

-- 1. ��� ���̺��� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
-- ��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
select			empno, ename, hiredate, deptno, sal
from			emp
where			deptno != 10 and sal between 1000 and 3000;

-- 2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
--    ����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
--   - ������ ������ 12������ ���� ����� ��.
select		empno, ename, sal, comm, sal+nvl(comm, 0) as total, (sal+nvl(comm, 0))/12 as monp
from		emp
where		comm is not null or comm!=0;

-- 3.  ��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ
--    �Ի���, ������ ��ȸ �ϼ���.
--    -��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
--    �� �������� �ϰ�, �÷����� output ���� �����Ұ�.
select		empno||'�� '||ename||'����� '||hiredate||'�⿡ �Ի��Ͽ��� ������'||sal||'$�Դϴ�.' as output
from		emp
where		deptno in (10, 30);

-- 4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
--   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
--   ��, ������ ������������ �����ϵ� ������ ���ٸ� ������� ������������
--   �����Ұ�.
select		empno, ename, hiredate, sal, job, deptno
from 		emp
where		sal<3000
order by sal asc, ename desc;

--5. test_like ���̺� �Ʒ��� ���� �����͸� �߰��Ұ�.
--    7, ����������,����� ���۱� �󵵵�,'�����'
--    8, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
--    9, ���¼�,����� ���빮�� ���빮2��,'�����'
insert into test_like values(7, '����������', '����� ���۱� �󵵵�', '�����');
insert into test_like(num, name, loc, highschool) values (8, '���븸', '����� ���빮�� ���빮1��', '��Ÿ��');
insert into test_like(num, name, loc, highschool) values (9, '���¼�', '����� ���빮�� ���빮2��', '�����');

-- 6. test_like ���̺��� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
--   �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
--   �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
--   ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx

select		'��ȣ: '||num||', �̸�: '||name||', �ּ�: '||loc||', �б�: '||highschool as "Output"
from 		test_like
where		loc like '%�����%';

-- 7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
--   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ�Ұ�.
--   ��, ��� �����ʹ� ������ ������������ �����ϰ�, ������ ���ٸ�
--   ������� ���� �������� �����Ұ�.

select		empno, ename, sal, hiredate, deptno, job
from		emp
where    ename like '____' or sal>=3000
order by sal asc, ename asc;

-- 8.  test_like ���̺��� ����б����� ����ϰ� �б����� ����
--    �������� �����Ͽ� ����� ��.
--    ��, ����б� ���� ���ٸ� �ϳ��� ����ϼ���.(2������ �� ��.)

select			highschool
from  		test_like
group by		highschool
order by		highschool asc;

select			distinct highschool
from			test_like
order by		highschool asc;

-- 9. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬����
--   ��ȸ �ϼ���.
--   ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
select empno, ename, hiredate, sal, sal + (sal * 7 / 100) as nextsal
from	emp;

-- 10. ��� ���̺��� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
--    �� ����� �����, �����ȣ, �Ի���, ������ ��ȸ�ϼ���.
--    ��, ������ ������������ ����Ұ�.
select		ename, empno, hiredate, sal
from		emp
where		ename like '_____' and ename like '__A__'
order by sal asc;

-- 11. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
--     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
select		ename, sal, job, mgr, hiredate
from      emp
where		ename like 'A%' and sal>= 1600;

select * from TEST_LIKE;
select * from emp;
