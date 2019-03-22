select * from CP_EMP3;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'������', 10, '�븮', 3500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'������', 20, '����', 7500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'���ü�', 20, '�˹�', 1500);
commit;
-- cp_emp3 �� emp���̺��� 30�� �μ� ��������� ��� �߰�
insert into cp_emp3(empno, ename, deptno, job, sal)
		(select empno, ename, deptno, job, sal
		from  emp
		where deptno=30);

-- emp : �̱�����, cp_emp3 : �ѱ�����
-- �̱������ �ѱ������� ������ 2000������ ����޿��� �÷��ְ� �;�
-- 2000������ ����� �����ȣ, �����, ����, ������ ��ȸ
-- union : �ߺ������Ͱ� ��ȸ���� �ʴ´�.
-- union all : �ߺ������Ͱ� ��ȸ�ȴ�.
select empno, ename, sal, job
from  emp
where sal <= 2000
union
select empno, ename, sal, job
from  cp_emp3
where sal <= 2000;

select empno, ename, sal, job
from  emp
where sal <= 2000
union all
select empno, ename, sal, job
from  cp_emp3
where sal <= 2000;


-- ���ս�ų ���̺��� ��ȸ�Ǵ� �÷����� �������� ��� Error �߻�
select		empno, ename, sal, job
from		emp
where		sal <= 2000
union	all
select		empno, ename, sal
from		cp_emp3
where		sal <=2000;

-- �÷��� ���������� ��ġ���� �ʴ� ��쵵 Error
select		empno, ename, sal, job
from		emp
where		sal <= 2000
union	all
select		sal, job, ename, empno
from		cp_emp3
where		sal <=2000;

-- delete from cp_emp3 where empno >= 7521 and empno <= 7934;
-- delete from cp_emp3 where empno between 7499 and 7900;

-- intersect:
-- �̱� ������ ��������� �ѱ������� ��������� ��ġ�ϴ� ������ ��ȸ
select		empno, ename, sal, job
from		emp
where		sal <= 2000
intersect
select		empno, ename, sal, job
from		cp_emp3
where		sal <=2000;

-- minus : ���� select���� ��ȸ�� ����� ���� select���� ��ȸ�� ������� �� �������� ��ȸ
select		empno, ename, sal, job
from		emp
minus
select		empno, ename, sal, job
from		cp_emp3
where		sal <=2000;


