-- �ּ� 0�� ����, �ִ� ���Ǳ��� �ݺ������ϴ� while 

set serveroutput on

declare
	i number;
	odd number;
begin
	-- 1���� 10���� 1�� �����ϴ� ��� while
	i := 1;
	-- ���ǽ�
	while i <= 10 loop
	-- �ݺ����๮��
	dbms_output.put_line(i);
	-- ������, ���ҽ� - ���ǿ� �����Ͽ� �ݺ��� ���߱� ����
	i := i + 1;
	end loop;
	dbms_output.put_line('----------------------------------------------------------------------------------------------');
	-- 1 ~ 100 ������ Ȧ���� ����ϴ� while
	odd := 1;
	while odd <= 100 loop
	if mod(odd,2) = 1 then 
	dbms_output.put_line(odd); end if;
		odd := odd + 1;
	end loop;
end;
/