
set serveroutput on
declare
	-- ���̺� ������ ���̺� ��ü�� ���� �Ҵ��� �� ����.
	-- ������ ���ο� ������ ������ �� �ش� ������ ���̺��� ��ƾ� ���� �Ҵ��� �� �ִ�.
	type tab_a is table of number(1) index by binary_integer;
	arr_a tab_a;
begin
	arr_a(1) := 1;
	arr_a(2) := 2;
	arr_a(3) := 3;
	arr_a(4) := 4;
	arr_a(5) := 5;

--	tab_a(1) := 1;
--	tab_a(2) := 2;
--	tab_a(3) := 3;
--	tab_a(4) := 4;
--	tab_a(5) := 5;
	dbms_output.put_line(arr_a(1)||arr_a(2)||arr_a(3)||arr_a(4)||arr_a(5));
--	dbms_output.put_line(tab_a(1)||tab_a(2)||tab_a(3)||tab_a(4)||tab_a(5));
end;
/
