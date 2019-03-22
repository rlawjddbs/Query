-- ���� ���� : ������ ������ ��������
-- create user ������ identified by �ʱ���;
create user test_user identified by 1111;

-- ���ӱ���, �ڿ�������, ������ ����:
grant connect,resource,dba to test;

-- ���̺� ���� X (resource ������ �ο��Ǹ� ����)
create table my_table(num number);
insert into my_table values(1);
commit;
select * from my_table;

select sysdate, '����' msg from dual;

-- ������ ���� �ο� �� �Ϲ� ������ �������� ���� ����
create view test_view as (select num from my_table);
select * from user_views;
drop view test_view;

-- ���� ȸ�� :
-- revoke ����... from ������;
revoke dba from test;

-- ���� ȸ���� �����غ���(��й�ȣ �ٲٱ�, ���� �������� ������ �ȵǾ� ����)
create user test1 identified by 2222;

-- system �������� ���� (system/managerum)
-- ������ �������� ���� �� � ���̺��� �ִ��� Ȯ��
select tname from tab;

-- ������ �������� ���� �� ���� ��ȸ�غ��� (all_users, dba_users)
-- all_users : ������, ����ID, �������� ǥ��
-- dba_users : ������ �������� ǥ��
select * from all_users;
select * from dba_users;

