-- ����Ŭ�� �� �� �ּ�
/* ����Ŭ�� ���� �� �ּ� */

/*
��ȣ, �̸�, �ֹι�ȣ, ����, �÷�, �̸���, �Է����� ������ �� �ִ� class4_info ���̺��� ����.
*/


create table Class4_info(
	num number(4),
	name varchar2(15),
	ssn char(14),
	age number(3),
	eye number(3, 2),
	email varchar2(50),
	input_date date
);

/*
drop table class4_info;
purge recyclebin;
*/
-- ������ ���̺��� ���� ���� : sqlplus ��
desc Class4_info;

-- ������ ���̺� �� ��ȸ : SQL ��
SELECT tname FROM tab;
