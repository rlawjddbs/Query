-- package body ���� : ���� ����
create or replace package body test_pack
is  
	------------------------- get_name function ���� -----------------
	function get_name(name varchar2) return varchar2
	is
	begin
		return to_char(sysdate, 'day')||' �Դϴ�. '||name||'�� �ȳ��ϼ���';
	end get_name; /* end ���� �Լ����� �����൵ �ǰ� ����� �ȴ�. */
	------------------------- get_name function �� --------------------
	
	------------------------- get_age procedure ���� -----------------
	procedure get_age(birth_year in number, age out number)
	is
	begin
		age := to_char(sysdate, 'yyyy') - birth_year+1;		
	end get_age; /* end ���� ���ν������� �����൵ �ǰ� ����� �ȴ�.*/
	------------------------- get_age procedure �� --------------------
end;
/
