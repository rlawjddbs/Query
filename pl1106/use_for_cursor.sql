-- �μ���ȣ�� �Է¹޾� �ش� �μ��� ����
-- �����ȣ, �����, �Ի���, ������ ��ȸ
-- �Ի����� "��-��-�� �б�"�� �������� ���
set serveroutput on
set verify off
accept deptno prompt '�μ���ȣ : '
declare
	--1. ����
	cursor cur_emp is
		select	empno, ename, to_char(hiredate,'yyyy-mm-dd q') as hiredate, sal
		from	emp
		where deptno = &deptno;
begin
--	open cur_emp;
	--2. for�� ����� ���� (fetch�� ������� �ʴ´�.)
	for emp_data in cur_emp loop
		dbms_output.put_line(emp_data.empno||' '||emp_data.ename||' '||emp_data.sal||' '||emp_data.hiredate);	
	end loop;
	
--	close cur_emp;
end;
/