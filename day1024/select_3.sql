-- ����
-- ��� ���̺��� �����ȣ, �����, ����, �Ի��� ��ȸ
-- ��, ������ ������������ ���� ����� ��. ������ ���ٸ� �Ի����� ������������ �����Ͽ� ����� ��.

select			empno, ename, sal, hiredate
from			emp
order by 		sal asc, hiredate desc, empno asc;
-- ���⼭ asc�� �������� (�⺻������ ������������ ���� ��)

-- ��� ���̺��� �Ŵ�����ȣ, �����ȣ, �����, ������ ��ȸ
-- ��, �Ŵ��� ��ȣ�� ������������ �����ϵ�, �Ŵ�����ȣ�� ���ٸ� ������� ������������ ����

select			mgr, empno, ename, sal
from    		emp
order by		mgr desc, ename asc;

create table test_orderby(
	num	varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');
commit;

-- ��ȣ �������� ���� : ���ڿ��� ������ �ڸ����� ����
select		num
from		test_orderby
order by num asc;

-- ��ȣ �������� ����
select		num
from		test_orderby
order by	num	desc;

select * from TEST_ORDERBY;
select * from EMP;
