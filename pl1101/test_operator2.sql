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

dbms_output.put_line('�̸� : '||name||'�� ���̴� '||age||'�� �Դϴ�.');   
		
		birth := to_char(sysdate, 'yyyy') -age + 1;
		dbms_output.put_line(age||'�� �¾�� '||birth||'���');
		-- ���ڿ��� ������ �ȵȴ�.
--		dbms_output.put_line(age||'�� �¾�� '||to_char(sysdate, 'yyyy') - age + 1||'���');
		-- ||�� ��� �����ں��� ���� �����ϱ� ������
		-- '�� �¾�� 2018' - age + 1 �� �Ǿ� ������.
		dbms_output.put_line(age||'�� �¾�� '||(to_char(sysdate, 'yyyy') - age + 1)||'���');
		-- || ���̿� �ִ� ���� ���� ��Ű���� ||���� ���� ����ǵ��� �Ұ�ȣ( )�� �����ش�.
end;
/
