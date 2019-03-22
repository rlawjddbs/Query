-- ���ڿ� ������ like���� ����� ���̺� test_like
-- num �÷� : ����
-- name �÷� : ������ 10��( 3byte * 10 = 30)
-- loc �÷� : ������ 100��( 3byte * 100 = 300)
-- highschool �÷� : ������ 20��( 3byte * 20 = 60)
create table test_like(
	num	number,
	name	varchar2(30),
	loc		varchar2(300),
	highschool varchar2(60)
);

insert into test_like(num, name, loc, highschool) values (1, '������', '����� ������ ���ﵿ', '������');
insert into test_like(num, name, loc, highschool) values (2, '������', '����� ���α� ���ﵿ', '������');
insert into test_like(num, name, loc, highschool) values (3, '�ڿ���', '��⵵ ������ ���뱸', '���հ�');
insert into test_like(num, name, loc, highschool) values (4, '����ö', '����� ���ʱ� ���ʵ�', '������');
insert into test_like(num, name, loc, highschool) values (5, '��������', '���� ��絿', '�ð�');
insert into test_like(num, name, loc, highschool) values (6, '������', '��⵵ ������ ������', '������');

commit;

-- like ������ %(�ۼ�Ʈ), _(�����) ��ȣ�� ���� ���
-- "%" - ��� ���ڿ�
-- "_" - �� ����

-- test_like ���̺��� '�����'�� ��� ����� ��ȣ, �̸�, ������, ��� ����б��� ��ȸ

select		num, name, loc, highschool
from		test_like
where		loc like '�����%';
-- where loc='�����' �� ����.

select		num, name, loc, highschool
from		test_like
where		name='������';

-- �̸��� '��'���� ������ �л��� ��ȣ, �̸�, �ּҸ� ��ȸ
select		num, name, loc
from		test_like
where 	name like '%��';

-- �̸��� '��'�� ���� �Ǿ��ִ� �л��� ��ȣ, �̸�, �ּ�, ��� ����б��� ��ȸ
select		num, name, loc, highschool
from		test_like
where		name like '%��%';

-- �̸��� 3�����̸� ��� ���ڰ� '��'�� �л��� ��ȣ, �̸� ��ȸ
select		num, name
from		test_like
where		name like '_��_';

-- �̸��� 4������ �л��� ��ȣ, �̸�, ��� ����б����� ��ȸ
select		num, name, highschool
from 		test_like
where		name like '____';

select * from TEST_LIKE;

-- ���� �ּҸ� �����ϴ� ���̺�
-- zipcode 7byte, sido 6byte, gugun 25byte, dong 60byte
create table zipcode(
	zipcode	char(7),
	sido		char(6),
	gugun	varchar2(25),
	dong		varchar2(100),
	bunji		varchar2(25),
	seq		number(5)
);

-- ������ ���� dong �÷� �ִ� byte 70���� 100���� �ٲ�
alter table zipcode modify dong varchar2(100);

-- ���̺��� ���ڵ带 ��� ������.
truncate table zipcode;

-- ���̺��� ���ڵ尡 ����� �˷���.
select count(*) from zipcode;

-- �츮���� ���� �ּҸ� ��ȸ
-- ���̸�)
select		zipcode, sido, gugun, dong, bunji, seq
from      zipcode
where		dong='�󵵵�';

select		zipcode, sido, gugun, dong, bunji, seq
from      zipcode
where		dong like '%���ﵿ%';

-- ������̺��� ����� 'L'�� �ΰ� ����ִ� ����� �����ȣ, ����� �Ի��� ��ȸ
select		empno, ename, hiredate
from		emp
where 	ename like '%L%L%';

-- ������̺��� ����� 'A'�� �ΰ� ����ִ� ����� �����ȣ, ����� �Ի��� ��ȸ
select		empno, ename, hiredate
from		emp
where 	ename like '%A%A%';

-- ������̺��� �μ���ȣ ��ȸ
select      deptno
from		 emp;

-- �ߺ�����
-- ������̺��� �Ŵ��� ��ȣ�� ��ȸ
-- ��, �ߺ��Ǵ� �Ŵ�����ȣ�� ������� �ʴ´�.
select		mgr
from		emp;


-- distinct �����Լ��� ����Ͽ� �׷캰 ���踦 ������ �� ����.
-- �ٸ� ���� ������ �÷��� ���� ����� ���, ��� �÷��� ���� �����ؾ� �ߺ� ������ �ȴ�.
select distinct 	mgr/*, ename*/
from				emp;

-- group by : �׷����� �������� ���� �÷��� ���� ���Ǹ� error
select		mgr/*, ename*/
from		emp
group by mgr/*, ename*/;

select * from EMP;
select * from ZIPCODE;
