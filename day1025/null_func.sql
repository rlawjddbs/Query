-- null ��ȯ
-- ���ڵ带 �߰��� �� �÷��� ������� ������ null�� ��
-- varchar2(char) : �÷��� ������� �ʰų�, '' �� ���, null�� ��
-- number, date : �÷��� ������� ���� ���

-- ��� ���̺��� �����, ����, ���ʽ� ��ȸ
-- ��, ���ʽ��� ���� ������� 100���� ���
select		ename, sal, nvl(comm, '100')
from		emp;

-- �����ȣ ���̺��� �Է��� ���� �����ȣ, �õ�, ����, ��, ���� ��ȸ
-- ��, ������ ���ٸ� '��������'�� ���

select 	zipcode, sido, gugun, dong, nvl(bunji, '��������')
from		zipcode
where		dong like '����1��%';

-- class4_info ���̺��� ��ȣ, �̸�, �Է��� ��ȸ
-- ��, �Է����� ���ٸ� ���� ��¥�� ���

select		num, name, nvl(input_date, sysdate)
from		class4_info;



select * from emp;

