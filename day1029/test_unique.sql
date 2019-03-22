-- unique : ���� ���� ���� �ְ� �ִٸ� �����ؾ� �� ��(�ߺ����� �ʾƾ� �� ��)
-- �̸�, �̸���(�ߺ�X), �ּҸ� �����ϴ� ���̺� ����

create table column_unique(
	name		varchar2(30),
	email		varchar2(50) constraint uk_email unique,
	address	varchar2(100)
);

select * from column_unique;
select * from user_constraints;

-- �߰�����, �����Է�
insert into column_unique(name, email, addr)
values('������','lee@test.com','��⵵ ������ ���뱸');
commit;
-- �̸����� ���� ��쿡�� unique�� null�� ����ϹǷ� ���� ��
insert into column_unique(name, addr)
values('������','��⵵ ������ ���뱸');
insert into column_unique(name, email, addr)
values('������1', '', '��⵵ ������ ���뱸');
select * from column_unique;

-- ����
-- ���� �̸����� �ԷµǾ��� ��
insert into column_unique(name, email, address)
values('�ڿ���','lee@test.com', '�λ��');

-- ���̺� ����
-- ��ȣ, �̸�, ��ȭ��ȣ, ī���ȣ�� �����ϴ� ���̺����
-- ��ȭ��ȣ�� ī���ȣ�� ���� ���� �ְ�, �ִٸ� ������ ��(�ߺ����� �ʵ��� �� ��).
create table table_unique(
 	num			number(5),
 	name			varchar2(30),
 	tel				varchar2(13),
 	card_num	char(4),
 	constraint uk_tel 	unique(tel),
 	constraint uk_card_num unique(card_num)
);

select * from user_constraints;
select * from user_indexes;

-- �߰�����
-- �����Է�
insert into table_unique(num, name, tel, card_num) values(1, '������', '010-8769-6112', '1234');
select * from table_unique;
-- ��ȭ��ȣ�� ī���ȣ�� �ٸ� ���
insert into table_unique(num, name, tel, card_num) values(2, '��������', '', '');
-- null�� �ԷµǴ� ���
insert into table_unique(num, name) values(3, '������');
select * from table_unique;
select * from table_unique;

-- ����
-- ��ȭ��ȣ�� ī���ȣ�� �� �� �ϳ��� ���ٸ� ����
insert into table_unique(num, name, tel, card_num)values(4, '���ü�', '010-1111-2223', '1234');
insert into table_unique(num, name, tel, card_num)values(4, '���ü�', '010-8769-6112', '1234');


select * from user_constraints;
