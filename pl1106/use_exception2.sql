-- select �� ���� ���� ��ȸ�ϰų�, �� ���� ��ȸ�� �� ����ó��
-- �����ȣ�� �Է¹޾� cp_emp3 ���̺��� �ش� �����
-- �����, �μ���ȣ, ����, ������ ��ȸ�ϴ� PL/SQL �ۼ�
set serveroutput on
set verify off
	accept empno prompt '�����ȣ : '
declare
	i_empno number := &empno;
	
	type rec_emp is record(
		ename cp_emp3.ename%type,
		deptno cp_emp3.deptno%type,
		job cp_emp3.job%type,
		sal cp_emp3.sal%type
	);
	emp_data rec_emp;
begin
	select ename, deptno, job, sal
	into 	emp_data
	from	cp_emp3
	where empno = i_empno;
	
	dbms_output.put_line(emp_data.ename||' '||emp_data.deptno||' '||emp_data.job||' '||emp_data.sal);
	
	exception
	when others then
		-- ��� ���ܸ� �� ó���� �� �ִ�.
		-- �ֻ��� �����̱� ������ exception���� ���� �ռ�
		-- �����ϰ� �Ǹ� ���� ����ó�� ��ü�� ���ܸ� ó���ϱ�����
		-- others �� ó���ϰ� �ǹ�����.
		-- dbms_output.put_line('�ν����� ���� ����');
		-- dbms_output.put_line(sqlerrm);
		-- dbms_output.put_line(sqlcode); 
		if sqlcode = 100 then
			dbms_output.put_line('�����ڵ� "'||sqlcode||'"�� -> ��������� ��ȸ���� �ʽ��ϴ�.');
		end if;
		if sqlcode = -1422 then
			dbms_output.put_line('�����ڵ� "'||sqlcode||'"�� -> �����ȣ�� �������� ��ȸ�˴ϴ�.');
		end if;
--	when too_many_rows then
--		dbms_output.put_line(i_empno||'�� ����� �Ѱ� �̻� �����մϴ�.');
--	when no_data_found then 
--		dbms_output.put_line(i_empno||'�� ����� �������� �ʽ��ϴ�.');

		
end;
/