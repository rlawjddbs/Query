-- �����, ��ǰ��, ������ �Է� �޾� ó���ϴ� PL/SQL �ۼ�
-- ����� ������� 'Ư��' �Ǵ� '�Ϲ�'�� ��쿡�� ������ ����
-- Ư������ ��ǰ������ ��ǰ���� 50%, �Ϲݰ��� ��ǰ������
-- ��ǰ���� 30%�� ����Ͽ� ���

set verify off
set serveroutput on

accept grade prompt '����� : '
accept item_name prompt '��ǰ�� : '
accept price prompt '���� : '

declare
	grade char(6) := '&grade';
	item_name varchar(60) := '&item_name';
	price number := &price;
	sale number;
begin
	if grade in('Ư��', '�Ϲ�') then
		if grade = 'Ư��' then
		    sale := price-price*0.5;
		else 
		    sale := price-price*0.3;		
		end if;
		dbms_output.put_line(grade||'���� �����Ͻ� ��ǰ '||item_name||'�̰� ���� '||price||'���̸� ���ΰ� '||(sale)||'�� �Դϴ�.');
	end if;
end;
/
