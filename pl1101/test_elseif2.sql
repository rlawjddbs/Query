-- ������ �Է¹޾� ���� ������.
-- ���� if (else~if)
-- ������ �Է¹޾� ������ 0���� ���� ��� '���� �۾� ����'
-- 100���� ū ��� '100���� Ŀ�� ����' �׷��� ������ '����' ���
-- PL/SQL �ۼ�

set verify off
set serveroutput on
 
accept score prompt '���� : '
declare
	u_score number := &score;
begin
	if u_score between 0 and 100 then dbms_output.put_line('����, ����� ������ '||u_score||'�� �Դϴ�.');
	elsif u_score < 0 then dbms_output.put_line('����, 0�� �̸��Դϴ�.');
	else dbms_output.put_line('����, 100�� �̻��Դϴ�.');
	end if;
end;
/
