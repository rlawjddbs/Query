-- check, not null, default
-- check : �÷��� ���� ��ȿ�� ������ ������ �߰��ϸ� �� ���ǿ� �������� ������� �Է°��� �������� ����.
-- not null : ���� �ݵ�� �Է� �޾ƾ��� �� ���
-- default : �÷����� �����ǰų� �÷��� �����Ǿ� null�� �Է� �Ǿ��� �� ��� �� �⺻���� ��.

-- �̸�, ����, �ּ�, �Է����� �����ϴ� ���̺��� ����
-- ��, �̸��� �ʼ� �Է�, ���̴� 20~30�� ���� �Է°���
-- �Է����� �����Ǹ� ���� ��¥�� �ڵ������� �Էµǵ��� ����.
create table other_constraints(
	name			varchar2(30byte) constraint c_name not null,
	age			number(2) constraint c_age check(age >= 20 and age <= 39), /* check(age between 20 and 39)*/
	input_date 	date default sysdate
);


-- user_constraints ������ �������(PK, FK, UK, check, not null)�� Ȯ�ΰ���
select * from user_constraints;

select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';

-- �߰� ����
-- ���� ������
insert into other_constraints(name, age, addr, input_date) values('������', 27, '�����', '2018-10-26');
select * from other_constraints;
-- �ּҿ� �Է����� ����
insert into other_constraints(name, age) values('�ڿ���', 27);
select * from other_constraints;

-- Error
-- �̸��� �����Ǵ� ��� (name �÷��� not null ���ǿ� ����)
insert into other_constraints(age, addr, input_date) values(27, '�����', '2018-10-26');
insert into other_constraints(name, age, addr, input_date) values('', 27, '�����', '2018-10-26');

-- ���̰� 20~30�밡 �ƴ� ���
insert into other_constraints(name, age, addr, input_date) values('������', 19, '�����', '2018-10-26');
insert into other_constraints(name, age, addr, input_date) values('������', 40, '�����', '2018-10-26');

-- not null�� '���̺� ����'�� ��������δ� ������ �� ����.
create table temp(
	name		varchar2(10),
	constraint c_name1 not null(name)
);
