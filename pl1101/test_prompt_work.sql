-- �̸� ���̸� �Է¹޾� ref_tab ���̺��� �����Ͽ� ������
-- ����(record ����)�� ���� �Է��� �� �Ʒ��� ���� ����ϴ�
-- PL/SQL�� �����ϼ���.
-- ��� ) �̸� : xxx�� ���� : xx �� 
-- ( �۳⳪�� xx��, ���⳪�� : xx��)

set serveroutput on
set verify off
accept your_name 	prompt '�̸��� �Է��ϼ��� : '
accept your_age	prompt '���̸� �Է��ϼ��� : '

declare
 -- ���̺��� �÷��� �����Ͽ� ���� ����
	r_name_age ref_tab%rowtype;

begin
	r_name_age.name := '&your_name';
	r_name_age.age := &your_age;
	
	dbms_output.put_line('�̸� : '||r_name_age.name||'�� ���� : '||r_name_age.age||' ��');
	dbms_output.put_line('�۳⳪�� '||(r_name_age.age-1)||'�� , ���⳪�� : '||(r_name_age.age+1)||'��');
end;
/