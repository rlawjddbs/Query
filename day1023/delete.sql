-- ���̺��� ��� ���ڵ带 �����ϰų�, ���ǿ� �´� Ư�� ���ڵ带 ������ �� ����ϴ� ���� delete

-- ��� ���ڵ带 ���� �� ��
-- delete from class4_info;

-- Ư�� ���ڵ常 ���� �� �� ex) �л��� ��ȣ�� 11���� �л��� ���ڵ� ����
/*
delete	from	class4_info
where	num=11;
*/

-- truncate�� ���̺��� ���ڵ带 �����Ѵ�.
/*
truncate table class4_info;
*/

-- �ʿ���� ���̺� ����.
-- ������ ���̺��� Oracle10g ���� ���������� �̵��Ѵ�.

drop table class4_info;

-- ������ ���� : sqlplus��
-- show recyclebin;

-- ������ ���� : sqlplus��
-- purge recyclebin;

-- ������ ���̺� ���� : sqlplus��
-- flashback table ���� ���̺�� to before drop;