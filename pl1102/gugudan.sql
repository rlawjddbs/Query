set serveroutput on
declare

begin
	-- for �� ���� for ���� ���� �ݺ��� �� �ٱ��� for���� �ݺ��ȴ�.
	for i in 2 .. 9 loop
		for z in 1 .. 9 loop
			dbms_output.put_line(i||' * '||z||' = '||(i*z));
		end loop;
	end loop;

end;
/