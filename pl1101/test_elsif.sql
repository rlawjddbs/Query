-- ���� if (else~if)
-- ������ �Է¹޾� ������ 0���� ���� ��� '���� �۾� ����'
-- 100���� ū ��� '100���� Ŀ�� ����' �׷��� ������ '����' ���
-- PL/SQL �ۼ�
-- else if �� �ƴ϶� elsif �� �ۼ��ؾ� �Ѵ�.
set verify off
set serveroutput on
	accept score prompt '������ �Է��ϼ��� : '
declare
	score number := &score;
begin
	dbms_output.put_line(score);
	if score < 0 then
		dbms_output.put_line(' ���� 0���� �۾Ƽ� ����');
	elsif score > 100 then
		dbms_output.put_line(' ���� 100���� Ŀ�� ����');
	else
		dbms_output.put_line(' ���� �Է� ���� o(^^O)(O^^)o');
	end if;
end;
/