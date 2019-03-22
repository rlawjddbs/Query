-- ��������� Ȯ�� : select ������ �÷� from user_constraints
-- ��������� �ߺ� ����, null ����, Ư�� �� ���� � ���ȴ�.
select *
from user_constraints;

-- ��ȣ, �̸�, ��ȭ��ȣ, �ֹι�ȣ, �̸��� �����ϴ� ���̺� ����,
-- �ֹι�ȣ�� null�� ������� �����鼭 �����ؾ��Ѵ�.

--create table column_primary(
--	num 		number,
--	name     varchar2(30),
--	tel			varchar2(13),
--	ssn		char(14) primary key,
--	email		varchar2(50)
--);

-- insert into column_primary (num, name, ssn) values(1,'test','880101-1234567');
-- insert into dept(deptno, dname, loc) values(10,'t','t');
-- drop table column_primary;
-- purge recyclebin;

-- drop : ���̺��� ���� ��
-- purge recyclebin : �����뿡 ������ ���̺��� ������ ���� ��

create table column_primary(
	num 		number,
	name     varchar2(30),
	tel			varchar2(13),
	ssn		char(14) constraint pk_column_primary primary key,
	email		varchar2(50)
);
------------------------------------------------------------------------------------------------------------------
-- �÷��ϳ��� PK�� �����Ǵ� ���
------------------------------------------------------------------------------------------------------------------
-- ���ڵ� �߰� ������ ��
-- ���� ���ڵ� ���Խ� �����ϰ� �Ǿ�����
insert into column_primary(num, name, tel, ssn, email) values(1,'������','010-1234-5678','880101_1234567','lee@test.com');
commit;

-- �ֹι�ȣ�� �ٸ� ��쵵 �����ϰ� �Ǿ�����
insert into column_primary(num, name, tel, ssn, email) values(2,'������','010-2222-6432','890101_1234567','lee@test.com');
commit;

-- �߰� ����
-- �ֹι�ȣ�� ���� �ֹι�ȣ�� �ԷµǴ� ��� �����ϰ� �Ǿ�����
insert into column_primary(num, name, tel, ssn, email) values(2,'������','010-7281-1279','890101_1234567','jung@test.com');
commit;
-- null�� �ԷµǴ� ��쵵 �����ϰ� �Ǿ�����
-- ����, ��¥�� �÷��� �����Ǹ� null�� �Էµǰ�
-- ���ڿ�(��������, ��������)�� �÷��� �����Ǵ� ���� "(empty)�� �����Ͱ� �߰��Ǵ� ��쿡 null�� �Էµȴ�."

-- ���1. �÷��� �����Ǿ� insert �Ǵ� ���
insert into column_primary(num, name, tel, email) values(2,'������','010-7281-1279', 'jung@test.com');
commit;
-- ���2. �÷��� ���ǵǾ� ������ ���� ����ǥ ( ' ) �� �ٿ��� �ԷµǴ� ��� ���� null ���� ����ǹǷ� �����ϰ� ��
insert into column_primary(num, name, tel, ssn, email) values(2,'������','010-7281-1279', '', 'jung@test.com');
commit;

-- primary key�� �����ų ������� ����� ���� �÷����� �ĺ�Ű ��� �Ѵ�.(?)

-- table level constraint
-- �̸�, ���̵�, ��й�ȣ �����ϴ� ���̺� ����
-- ���̵�� null�� ������� �����鼭 ���� �����ؾ� �Ѵ�.

create table table_primary(
	name	varchar2(30),
	id		varchar2(20),
	passwd	varchar2(30),
	constraint	pk_table_primary	primary key(id)
);

-- �߰�����
insert into table_primary(name, id, passwd) values('����ö', 'kim', '1234');
commit;
-- �߰�����
insert into table_primary(name, passwd) values('����ö', '1234');
commit;


-- �������� �÷��� PK�� ���еǴ� ���,
-- table ���� ����������θ� ��������

-- �����۸�, ������ ��ȣ, ����
-- ������ ����� ���ڵ尡 �߰��� ��
-- ���������� �����ϸ� 'ITEM_0001'�� ������ ������.
-- ������ ��ȣ��, �����۸��� ���� �� ����.
create	table	table_multi_primary(
	item_num	char(9),
	item			varchar2(60),
	item_info		varchar2(4000),
	constraint 	pk_table_multi_primary primary key(item_num, item)
);

select * from TABLE_MULTI_PRIMARY;
select * from user_constraints;


-- 'ITEM_0001' ��ȸ
select concat('ITEM_', lpad(nvl(max(item_num),0)+1,4,0))
from	table_multi_primary;
-- concat('���Ϲ���', ����÷�)
-- lpad(����÷���, ǥ���� �ִ� �ڸ���, �ڸ����� �����ҽ� ���� ����/����)
-- nvl(����÷���, null�� ��� �ٲ� ������ ��) : ��ȸ�� ���ڵ尡 null�� ���� ��ǥ �ڿ� �ۼ��� ������ ���� ����
-- max(�ִ밪�� Ȯ���� �÷���)
-- �������� �÷��� �ϳ��� PK�� �����Ǵ� ���
-- �߰����� : ���� ������ �Է�
insert into	table_multi_primary(item_num, item, item_info)
values(
		 (select	concat('ITEM_', lpad(nvl(max(item_num),0)+1,4,0)) from table_multi_primary),'���ĸ�',
		 '�ٷ� �� ���̴����� ������ ����ź�� ���� �ٷ� �� ������ ���̴��� ��� ��� �� �ִ�.');
commit;


-- delete  table_multi_primary where item_num='ITEM_0003';

insert into	table_multi_primary(item_num, item, item_info)
values(
		 (select	concat('ITEM_', lpad(max(substr(item_num, instr(item_num, '_')+1))+1,4,0))
from table_multi_primary),'����ź', '������ ���̴��鿡�� ū ����ź�� ���� ���̴����� ��� ��� �� �ִ�.');
commit;
select * from table_multi_primary;

-- �� �÷��� �ϳ��� �÷��� �� �ٸ� ��� : '����
insert into	table_multi_primary(item_num, item, item_info)
values('ITEM_0002','���ĸ�', '������ ���̴��鿡�� ū ����ź�� ���� ���̴����� ��� ��� �� �ִ�.');
commit;
select * from table_multi_primary;

-- �� �÷��� ��� �������� ���� ��� : Error �߻�
insert into	table_multi_primary(item_num, item, item_info)
values('ITEM_0002','���ĸ�', '���ϸ� ¥����.');

 -- �� �� �ϳ��� null�� �߰��� �� : Error �߻�
insert into	table_multi_primary(item_num, item, item_info)
values('','���ĸ�', '���ϸ� ¥����.');
insert into	table_multi_primary(item_num, item_info)
values('ITEM_0003','�ռ� Ư�� ���̴��� �����Ͽ� �̻��� �߻� .');

--delete from dept
--where deptno = 30;

--rollback;
--select * from dept;

----------------------------------------------------------------------------------------------------------------
-- ���� ������ ��� ��ȣ���� 1������ ������
-- 'EMMP_00007899'�� ������ ���� ���� ��ȸ
-- ���� Ǭ ��
select     rownum as listno, empno1
from		(
select		'EMMP_'||lpad(empno+1, 8, '0') as empno1, hiredate
from		emp
order by		empno desc
)
where		rownum=1;
-- ���� Ǯ��
select		concat('EMP_', lpad(max(empno)+1, 8, 0)) as listno
from		emp;

select * from emp;
----------------------------------------------------------------------------------------------------------------

select * from table_primary;
select * from column_primary;
select *
from user_constraints;

