-- * ��ǰ��, �����(Ư��, �Ϲ�), ������ �Է¹޾� ������� 'Ư��' �̶��
-- ��ǰ������ 30% ���ε� �������� ����ϼ���.
-- xx��� ���� xxx��ǰ��
-- ������ xx�� �Դϴ�.
-- "Ư���� ��쿡�� �Ʒ��� �޼��� ���
-- ��ǰ���� xx�� ���ΰ� xx��

set serveroutput on
set verify off

accept product prompt '��ǰ�� �Է� : '
accept grade prompt '��� �Է� : '
accept price prompt '���� �Է�(��) : '
                                                         
declare
	prod	varchar2(60) := '&product';
	grad	char(6) := '&grade';
	pric	number := &price;
begin

	dbms_output.put_line(grad||'��� ���� '||prod||'��ǰ��');
	dbms_output.put_line('������ '||to_char(pric, '99,999,999')||'�� �Դϴ�.');
	if grad = 'Ư��' then
	dbms_output.put_line(prod||' ��ǰ���� '||to_char(pric, '99,999,999')||'�� ���ΰ� '||to_char((pric - (pric * 0.3)),'99,999,999')||'��');
	end if;
end;
/