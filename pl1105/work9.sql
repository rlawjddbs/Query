--	����
--	1. ���� ���� �Է¹޾� car_model ���̺���
--	���, ����, �ɼ�, �Է����� ��ȸ�ϼ���.
--  �����
--	xxxx�� �˻� ���
------------------------------------------------------------------------------
--	���	���� 		�Է���	 			�ɼ�
------------------------------------------------------------------------------
-- 2010	1,990 		��-��-�� �б�	ó�� , ������
------------------------------------------------------------------------------
-- �˻� ��� [x] ��

-- (���⼭ ���� 2�ڸ��� ��ȸ,
-- ������ �������� �����Ͽ� ��ȸ,
-- Ŀ��, ���ڵ�, ���̺��� ��� ����Ͽ� ���)

set verify off
set serveroutput on
accept u_car_model prompt '���� �� : '

declare
	-- 1. Ŀ�� ����
   cursor cur_cars is
	   select 	car_year, to_char(price, '999,999,999'), substr(car_option, 1, instr(car_option, ',')), to_char(hiredate, 'mm-dd-yy')
	   from	car_model
	   where	model = '&u_car_model'
	   order by price asc;
	-- 2. ���ڵ� ����
	type rec_cars is record (
		rcar_year car_model.model%type,
		rprice varchar2(50),
		rcar_option car_model.car_option%type,
--		rinput_date car_model.inut_date%type
		rinput_date varchar2(8)
		);
	-- 3. ���̺� ����
	type tab_cars is table of rec_cars index by binary_integer;
	-- 4. ������ ���̺� ������ ���
	arr_cars tab_cars;
	-- 5. ������ ���ڵ�(2��)�� ������ ���
	cars_data rec_cars;

	i number := 0;

	bungi number;
begin
	-- 5. Ŀ�� ����
	if  cur_cars%isopen then
		close cur_cars;
	end if;
	open cur_cars;

	-- 6. ����
	loop
		fetch cur_cars into cars_data;
		exit when cur_cars%notfound;
	-- 6-1. ������ ó��
		i := i + 1;
		arr_cars(i) := cars_data;
	end loop;

	bungi := 0;
	if arr_cars.count != 0 then
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('&u_car_model'||'�� �˻����');
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('���	���� 		�Է���	 			�ɼ�');
		dbms_output.put_line('--------------------------------------------------------------------------------');
		for idx in 1 .. arr_cars.count loop
			if arr_cars(idx).rinput_date like '01%' or arr_cars(idx).rinput_date like '02%' or arr_cars(idx).rinput_date like '03%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '04%' or arr_cars(idx).rinput_date like '05%' or arr_cars(idx).rinput_date like '06%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '07%' or arr_cars(idx).rinput_date like '08%' or arr_cars(idx).rinput_date like '09%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '10%' or arr_cars(idx).rinput_date like '11%' or arr_cars(idx).rinput_date like '12%' then bungi := 1;
			end if;
			dbms_output.put_line(arr_cars(idx).rcar_year||'  '||arr_cars(idx).rprice||'            '||arr_cars(idx).rinput_date||' '||bungi||'�б�                    '||arr_cars(idx).rcar_option);
		end loop;
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('�˻� ��� ['||arr_cars.count||']��');
		dbms_output.put_line('--------------------------------------------------------------------------------');
	end if;


end;
/
