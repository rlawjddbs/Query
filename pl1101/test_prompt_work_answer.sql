set verify off
set serveroutput on

accept name prompt '�̸��Է� : '
accept age prompt '�����Է� : '

declare
	input_data ref_tab%rowtype;
begin
	-- ����ڰ� �Է��� ���� ���ڿ� �������� ��� ���� ����ǥ ' �� �����ְ�
	-- ������ ��쿡�� ���ۻ��常 �տ� �ٿ��ָ� �ȴ�.
	input_data.name := '&name';
	input_data.age := &age;
	
	dbms_output.put_line('�̸� : '||input_data.name||'�� ����: '||input_data.age||'��');
	dbms_output.put_line('�۳⳪�� '||(input_data.age-1)||'��, ���⳪�� : '||(input_data.age+1)||'��');
end;
/