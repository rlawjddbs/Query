-- 1 ~ 100���� ����ϴ� loop
set serveroutput on
declare
	-- �ݺ����� ����� ������ �ʱ�ȭ���� ���� �س��� �Ŀ� �ʱ�ȭ �ϴ� ���� ����. (�ڵ尡 ������� ��ũ���ؼ� �ö󰡾� �ϹǷ� ������)
	cnt number(3);
begin
	-- �ʱⰪ
	cnt := 1;
	loop
		dbms_output.put(cnt||' ');
		cnt := cnt + 1;    
		exit when cnt = 101;
	end loop;
	dbms_output.put_line(' ');
end;
/