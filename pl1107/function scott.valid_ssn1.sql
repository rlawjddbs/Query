--	* function - �ֹι�ȣ ��ȿ�� ����
--	* 880101-1234567

--	1. 234567 892345 �� �� �ڸ������� �����ش�. �����ڵ� �����.
--	2. 000000 000000 �� ������ ����� ���� ��� �����ش�.
--	3. �� ������ ���� ���� 11�� ���� �� �������� ���Ѵ�.
--	4. ���� ����� 11���� ����.
--	5. �� ����� 10���� ���� �������� ���Ѵ�.
--	6. �ֹι�ȣ�� ���ڸ��� ������ ���Ͽ�
--	7. ������ ��ȿ, ���� ������ ��ȿ
-- 121212-1234567 �� ���� ���� �� ��ȿ�� ������ �°� ��ȿ�� ������ �߸��� ��.
create or replace function valid_ssn1(ssn char)
return char
is
	result_msg char(6) := '��ȿ';
	init_num number := 2;
	op_num number;	
	total_num number := 0;
begin
	if length(ssn) = 14 and instr(ssn, '-') = 7 then
		for i in 1 .. 13 loop
			continue when i = 7;
--			exit when i = 14;						
			
			op_num := 0;
			op_num := op_num + substr(ssn, i, 1)	* init_num;
			init_num := init_num + 1;
			if init_num = 10 then init_num := 2; end if;
			total_num := total_num + op_num;			
		end loop;	
		if mod((11 - mod(total_num, 11)), 10) = substr(ssn, 14, 1) then result_msg := '��ȿ'; end if;
	end if;
--   		result_msg := '��ȿ';
		
	
   return result_msg;
end;
/
