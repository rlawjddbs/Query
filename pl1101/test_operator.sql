-- �ܺΰ� �Է� �ޱ�
set serveroutput on
-- ���� �ɼ� ����
set verify off

accept name1 prompt '�̸��Է� : '
accept age1 prompt '�����Է� : '
--accept age3 prompt '���� �Է� : '
--accept birth prompt '�¾�ظ� 4�ڸ����� �Է� : '

declare
		name varchar2(90);
		age number;
--		age2 number;
		birth number(4);
begin
		-- �Էµ� ���� ������ ����
		-- �Է� ���� ���ڿ��� ��쿡�� '�� ��� ����Ѵ�.
		name := '&name1';
		age := &age1;

--		dbms_output.put_line('�̸� : '||name||'�� ���̴� '||age||'�� �Դϴ�.');   
--		-- �¾�� ��� : xx�� �¾�� xxxx���   
--		age2 := &age3;
--		birth := &birth;   

dbms_output.put_line('�̸� : '||name||'�� ���̴� '||age||'�� �Դϴ�.');   
		-- �¾�� ��� : xx�� �¾�� xxxx���   
--		age2 := &age3;
		birth := to_char(sysdate, 'yyyy') -age + 1;
		
		dbms_output.put_line(age||'�� �¾�� '||birth||'���');
		
		-- ��� �����ڰ� �ƴ� �������� ����� ����� �� ����.
		dbms_output.put_line(age > 10);
end;
/
