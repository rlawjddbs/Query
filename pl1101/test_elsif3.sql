-- ������ �Է¹޾� 0~100 ������ �� ���� ���, 0~100���̰� �ƴ϶��
-- '�Է� ����'�� ����Ѵ�.
-- 0~100 ������ �� 0~40 ���� : '����'          
set verify off
set serveroutput on

accept score prompt '���� �Է� : '
declare
 	score number := &score;
begin	
	if score between 0 and 100 then
		if score <= 40 then 
			dbms_output.put_line('���� OTL');
		elsif score <=60 then 
			dbms_output.put_line('�ٸ� ���� ����');
		else 
			dbms_output.put_line('�հ�'); 
		end if;
	else
	dbms_output.put_line('������ 0~100���̸� �Է��� �ּ���.');
	end if;	
end;
/