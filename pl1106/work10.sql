--����1.
--�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
-- ������, ������,�𵨸�,���,����, �Է����� ��ȸ �ϼ���.
-- ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� �����
--   3~6��° ���ڵ常  ����ϼ���.
--
--����, ��Ƹ� �Է��Ͽ��� ��
-- ��� ��
-------------------------------------------------------------------
--��ȣ ������  ������  �𵨸�  ���  ����   �Է���
-------------------------------------------------------------------
--1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy
--
--
-------------------------------------------------------------------
--�˻� ��� ���� [x]��, ��� [x]��
--
--���� x��� ��� x��� �˻� ����� ���� ����� ī��Ʈ �մϴ�.

set verify off
set serveroutput on

accept maker1 prompt '������ 1 : '
accept maker2 prompt '������ 2 : '
declare
	type rec_maker is record(
		country car_country.country%type,
		maker car_country.maker%type,
		model car_maker.model%type,
		car_year car_model.car_year%type,
		price car_model.price%type,
		hiredate car_model.hiredate%type
	);
	type tab_maker is table of rec_maker index by binary_integer;
	arr_maker tab_maker;

	search_cnt number := 0;
	i number := 0;
	mi1 number :=0;
	mi2 number := 0;
begin
	for temp in (
		select	cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
		from	car_country cc, car_maker cma, car_model cmo
		where (cma.maker = cc.maker and cma.model = cmo.model) and (cc.maker = '&maker1' or cc.maker = '&maker2')
		order by cmo.price asc
		)
	loop
		i := i + 1;
		arr_maker(i) := temp;
	end loop;

	if arr_maker.count > 0 then
		dbms_output.put_line('-------------------------------------------------------------------');
		dbms_output.put_line('��ȣ ������  ������  �𵨸�  ���  ����   �Է��� ');
		dbms_output.put_line('-------------------------------------------------------------------');

		for i in 1 .. arr_maker.count loop
			if i between 3 and 6 then
				dbms_output.put_line(to_char(i,'99')||'   '||arr_maker(i).country||'    '||arr_maker(i).maker||'    '||arr_maker(i).model||'  '||arr_maker(i).car_year||'  '||
				to_char((arr_maker(i).price),'999,999')||'  '||
				to_char((arr_maker(i).hiredate),'mm-dd-yyyy'));
				if arr_maker(i).maker = '&maker1' then
				mi1 := mi1 + 1;
				end if;
				if arr_maker(i).maker = '&maker2' then
				mi2 := mi2 + 1;
				end if;			
			end if;
		end loop;
		dbms_output.put_line('-------------------------------------------------------------------');
		dbms_output.put_line('�˻��� ��� '||'&maker1'||'['||mi1||']��, '||'&maker2'||' ['||mi2||']��');
--		dbms_output.put_line('&maker1'||' �� ��� : '||mi1);
--		dbms_output.put_line('&maker2'||' �� ��� : '||mi2);
		
	else
		dbms_output.put_line('�˻������ �����ϴ�.');
	end if;
end;
/
