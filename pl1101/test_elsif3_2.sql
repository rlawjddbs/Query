set verify off
set serveroutput on

accept score prompt '������ �Է��ϼ��� : '
declare
	u_score number := &score;
begin
	if u_score >=0 and u_score <= 100 then
		if u_score <= 40 then dbms_output.put_line('����');
		elsif u_score >=41 and u_score <=60 then dbms_output.put_line('�ٸ����� ����');
		elsif u_score >= 61 and u_score <= 100 then dbms_output.put_line('�հ�');	
		end if; 
	else 
		dbms_output.put_line('������ 0~100���̸� �Է��� �ּ���.');
	end if;
end;
/        