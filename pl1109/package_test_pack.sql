-- ��Ű�� ��� : ��Ű���� �� �Լ�, ���ν����� ��� ����(���� ����x)
create or replace package test_pack
as
	function get_name(name varchar2) return varchar2;
	procedure get_age(birth_year in number, age out number);
end;
/
