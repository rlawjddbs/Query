set verify off
set serveroutput on

accept grade prompt '�� ��� �Է� : '
accept product prompt '��ǰ�� �Է� : '
accept price prompt '���� �Է�(��) : '

declare
	grad char(6) := '&grade';
	prod varchar(60) := '&product';
	pric number := &price;  
begin
    if grad = 'Ư��' then
    dbms_output.put_line(prod||' ��ǰ�� ������ '||to_char(pric, '99,999,999')||'�� �̸� ���� �� ������ '||to_char((pric-(pric * 0.5)), '99,999,999')||'�� �Դϴ�.');  
    end if;
    if grad = '�Ϲ�' then
    dbms_output.put_line(prod||' ��ǰ�� ������ '||to_char(pric, '99,999,999')||'�� �̸� ���� �� ������ '||to_char((pric-(pric * 0.3)), '99,999,999')||'�� �Դϴ�.'); 
    end if;   
end;
/