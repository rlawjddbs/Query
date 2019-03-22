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
accept u_model prompt '�˻��Ͻ� �� ���� �Է����ּ��� : '

declare
	cursor cur_cmo is
		select car_year, price, hiredate, car_option
		from car_model
		where model = '&u_model'
		order by price asc;
	
	type rec_cmo is record(
		rcar_year car_model.car_year%type,
		rprice car_model.price%type,
		rhiredate car_model.hiredate%type,
		rcar_option car_model.car_option%type
	);
	cmo_data rec_cmo;
	
	type tab_cmo is table of rec_cmo index by binary_integer;
	arr_cmo tab_cmo;
	
	i number := 1;
begin
	if cur_cmo%isopen then close cur_cmo; end if;
	open cur_cmo;
	
	loop
		fetch cur_cmo into cmo_data;
		exit when cur_cmo%notfound;
		arr_cmo(i) := cmo_data;
		i := i + 1;	
	end loop;   
	
	if arr_cmo.count != 0 then
		dbms_output.put_line('------------------------------');
		dbms_output.put_line('&u_model'||'�� �˻� ��� �Դϴ�.');
		dbms_output.put_line('---------------------------------------------------------');
 		dbms_output.put_line('���       ����      �Է���     �ɼ�');
		dbms_output.put_line('---------------------------------------------------------');
		for indx in 1 .. arr_cmo.count loop
			dbms_output.put_line(arr_cmo(indx).rcar_year||'     '||to_char((arr_cmo(indx).rprice),'99,999')||'     '||to_char((arr_cmo(indx).rhiredate),'yy-mm-dd')||'   '||
			nvl((substr((arr_cmo(indx).rcar_option), 1, instr((arr_cmo(indx).rcar_option), ','))),'�ɼǾ���'));
		end loop;
		dbms_output.put_line('---------------------------------------------------------');
	else 
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line('�˼��մϴ�. '||'&u_model'||'�� ���� ���Դϴ�.'); 
	dbms_output.put_line('---------------------------------------------------------');
	end if;
	close cur_cmo;
end;
/
