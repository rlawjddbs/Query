set serveroutput on
declare
	-- ���� ����
begin           
	-- �ڵ� �ۼ�
	-- put_line�� ��� �� ���� �����Ѵ�.
     dbms_output.put_line('�ȳ� PL/SQL');
     dbms_output.put_line('������ �����');
     -- put�� ��� �� �� ������ ���� �ʴ´�.
     dbms_output.put('������ �ݿ���');
     -- put���θ� ����� ����Ǹ� ��³����� ��µ��� �ʴ´�.
     dbms_output.put_line('�𷹴� �p');
end;
/
