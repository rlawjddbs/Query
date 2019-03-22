/*
���� ���� �Է¹޾� car_model ���̺���
������, ������, ���, ����, �ɼ�, �Է��� ��ȸ
*/

set verify off
set serveroutput on
	accept maker prompt '������   : '
declare
--��ȣ ������  ������  �𵨸�  ���  ����   �Է���
	type rec_car is record(
		country car_country.country%type,
		maker car_country.maker%type,
		model car_model.model%type,
		
		car_year car_model.car_year%type,
		price car_model.price%type,
		hiredate car_model.hiredate%type
		);
	-- ����� record ������������ table ����
	type tab_car is table of rec_car index by binary_integer;
	-- ����� table�� table ���� ����
	arr_car tab_car;
	
	-- ó�� ,������ ����ϱ� ����  �ɼ��� �����ϴ� ���� �����
	-- ��ü �˻� ������ �����ϱ� ���� ����
	cnt number := 0;
	 
	-- �ε����� �����ϱ� ���� ����
	i number := 0;
	j number := 0;
begin
	
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line('������ ������     ���  ����   �Է���     �ɼ�');
	dbms_output.put_line('---------------------------------------------------------');
	
	-- �˻��� ����� table�� ���� (�ڵ� �и�) - ����� ������ ����
	for temp in
		(select		cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
		 from			car_country cc, car_maker cma, car_model cmo
		 where		(cma.maker=cc.maker and cma.model=cmo.model) and cma.maker = '&maker'
		 order by		cmo.price	)	
	loop   	   
		i := i+1;
	    arr_car(i) := temp;	 	
	end loop;
--		search_cnt := i;
	-- ������ �����͸� ����Ͽ� ��� ������ ����� ����Ѵ�.
	
		for j in 1 .. arr_car.count loop
		
			if  j between 3 and 6 then
						dbms_output.put_line(j||arr_car(j).country ||'     '||arr_car(j).maker||'     '||arr_car(j).model||'  '||arr_car(j).car_year||' '||to_char((arr_car(j).price),'9,999')||'   '||to_char((arr_car(j).hiredate),'mm-dd-yy') ); 
						cnt := cnt+1;
			end if;
		end loop;
		
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line(' �˻� ��� ['||cnt||']��');	
end;
/