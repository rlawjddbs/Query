-- for : ���۰� ���� �Ѵ��� �� �� �ְ� 1�� �����ϴ� �ݺ���
set serveroutput on

declare
	i number;
	num number;
	total number;
	
	msg varchar2(30);
begin
    -- for�� �ȿ����� ���� i�� for�� �ٱ��� ���� i�� �̸��� �������� 
    -- for�� �������� ��ȿ�� �ٸ� �����̴�. (��������)
	for i in 1 .. 10 loop
		dbms_output.put_line('i = ' || i);
	end loop;
	-- for�� index�� �����ϴ� ������ declare ���� ����� ������
	-- ������� �ʴ´�. for�� ������ ��ü������ ����� ���Ǵ� �����̱� ������
	-- for�� �ܺο� �ۼ��� �Ǵٸ� for������ ���Ǵ� ������ �����͵� �浹���� �ʴ´�.
	dbms_output.put_line('for ���� i = ' || i);
	-- 1 ~ 9 ���� 1�� �����ϴ� for �ۼ��Ͽ� ���
	num := 2;
	for i in 1 .. 9 loop
		dbms_output.put_line(num||' * '|| i ||' = '||(num*i));
	end loop;
	
	-- 1 ~ 100������ �� ��� : 5050 (������)
	-- 1+2+3+4+5+ ... + 00
	total := 0;
	for idx in 1 .. 100 loop
		total := total + idx;
	end loop;
	dbms_output.put_line('1~100������ ���� '||total||' �Դϴ�.');   
	
	dbms_output.put_line('----------------------------------------------------------------------------------------');
	-- �ٱ� for�� �ε����� ������ ���.
	for i in 2 .. 9 loop
		dbms_output.put_line(i||'�� ����');
			-- ���� for�� �ε����� �������� �� ���.
			for j in 1 .. 9 loop
			dbms_output.put_line(i||' * '||j||' = '||(i * j));
			end loop;
		dbms_output.put_line(i||'�� ��');
	end loop;
	dbms_output.put_line('----------------------------------------------------------------------------------------');
	
	msg := '������ �ݿ��� �Դϴ�.';
	-- for�� ����Ͽ� ���� ���ھ� �߶󳻼� ���
	for i in 1..length(msg) loop
	dbms_output.put_line(substr(msg, i, 1));
	end loop; 
	-- reverse �� ���ۼ� �տ� ���� �� ������ �����ؼ� ���� �� ���� �ݺ���ų �� �ִ�.
	for i in reverse 1..length(msg) loop
	dbms_output.put_line(substr(msg, i, 1));
	end loop;
end;
/