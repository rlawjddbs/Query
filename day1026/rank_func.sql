-- ���� ���ϱ�
-- ��ü ���� ���ϱ�
-- rank() over(order by ������ ���� �÷��� ���Ĺ��) - �ߺ� ������ �߻��� �� �ִ�.
-- ��� ���̺���  �����ȣ, �����, ����, �������� ��ȸ
select			empno, ename, sal, rank() over(order by sal desc)
from			emp;

-- ��� ���̺��� �����ȣ, �����, ����, �������� ��ȸ
-- ��, �ߺ������� �߻����� �ʵ��� ó���Ͽ� ��ȸ �� ��.
select			empno, ename, sal, row_number() over(order by sal desc)
from			emp;

select			empno, ename, sal, row_number() over(order by sal desc) as sal_rank
from			emp
order by		sal_rank asc, ename asc;

-- ��ȸ�� ���ڵ带 �׷� �� ������ ��ȸ : partition by
-- ������̺��� �����ȣ, �����, ����, �μ��� ���� ���� ��ȸ
select		empno, ename, sal, deptno, rank() over(partition by deptno order by sal desc)
from		emp;

-- �μ��� ���� ������ �ߺ���ȣ ���� ��ȸ
select		empno, ename, sal, deptno,
			row_number() over(partition by deptno order by sal desc) sal_rank
from		emp;

select		empno, ename, sal, deptno,
			row_number() over(partition by deptno order by sal desc) sal_rank
from		emp
order by	deptno, sal_rank;

-----------------------------------------------------------------------------------------------------------
-- rollup, cube
-----------------------------------------------------------------------------------------------------------
-- rollup : �׷캰 �Ұ踦 ���� �� ����Ѵ�.
-- �׷����� ���̴� �÷��� �ϳ��� ��쿡�� �Ѱ谡 ��µȴ�.

-- ��� ���̺��� �μ���, ������ ���� ��ȸ�ϰ� �Ѱ踦 ���
-- rollup�� �Ұ谡 �������� ��µȴ�.
select                 deptno, sum(sal)
from					emp
group by				rollup(deptno);
-- cube�� �Ұ谡 ���� ��µȴ�.
select                 deptno, sum(sal)
from					emp
group by				cube(deptno);

-- ���� �÷��� �׷����� �������� rollup�� �׷캰 �Ұ踦 �������� ����Ѵ�.

-- ��� ���̺��� �μ���, ������ ������, �Ұ�, �Ѱ� ��ȸ
select				deptno, job, sum(sal)
from				emp
group by			rollup(deptno, job)
order by			deptno asc;

select * from emp;
-- �� �ڵ�� ���� �� ��  1
select				deptno, job, sum(sal)
from				emp
group by			deptno, job
order by			deptno asc;
-- �� �ڵ�� ���� �� �� 2

-- ��� ���̺��� �μ���, ������ ������, ������(�׷캰) �Ұ�, �Ѱ�, ��ȸ�Ǵ� ���ڵ��� �Ұ� ��ȸ
select				deptno, job, sum(sal)
from				emp
group by			cube(deptno, job)
order by			deptno asc;




select * from user_constraints;
desc dept;
