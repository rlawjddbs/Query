-- Ư�� ���̺��� ���ϴ� �÷��� ��� ���ڵ带 ��ȸ
-- Class4_info ���̺��� �̸�, ��ȣ, ���� ��ȸ

/*
SELECT name, num, age FROM Class4_info;
*/

-- ��ȸ�ϴ� �÷��� " * " �� ����ϸ� ��� �÷��� ��ȸ

/*
SELECT	*
FROM	Class4_info;
*/

-- �÷�ũ�� ����.
-- 0 : �����Ͱ� ���ٸ� 0�� ä�� ���
-- 9 : �����Ͱ� �����ϴ� �͸� ���
column num format 0000

-- ���ڿ��� "a���ڼ�"�� ����
column name format a6
-- Į���� ������ ������� ���� ����
col email format a10
col ssn format a6

col age format 999
col eye format 0.000

select * from class4_info;

-- �÷��� alias �ο�
select     num, name, input_date as i_date1, input_date as i_date2
from		CLASS4_INFO;
