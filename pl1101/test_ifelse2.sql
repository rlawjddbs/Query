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
begin
	if grade in('Ư��', '�Ϲ�') then
		if grade = 'Ư��' then
		dbms_output.put_line(grade||'���� �����Ͻ� ��ǰ '||item_name||'�̰� ���� '||price||'���̸� ���ΰ� '||(price-price*0.5)||'�� �Դϴ�.');
		else 
		dbms_output.put_line(grade||'���� �����Ͻ� ��ǰ '||item_name||'�̰� ���� '||price||'���̸� ���ΰ� '||(price-price*0.3)||'�� �Դϴ�.');
		end if;
	end if;
end;
/
