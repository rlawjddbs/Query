-- bind ������ ���
-- 1. bind ���� ���� : var[variable] ������ �������� (ũ��)
var name varchar2(30);
variable age number;

-- 2. bind ���� �� �Ҵ�  :������ := ��
set serveroutput on
declare
	name varchar2(30);
begin
	name :='�׽�Ʈ';
	-- 3. ���ε� ������ �� �Ҵ�
	:name := name||'�� �ȳ�';
	:age := 20;
	
	dbms_output.put_line(name ||'  '||:name||'  '||:age);
end;
/

	-- 4. ���ε� ������ �� ���
	print name age
	
	
	
	
