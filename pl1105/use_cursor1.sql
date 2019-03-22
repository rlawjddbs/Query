-- �μ���ȣ�� �Է¹޾� �ش�μ��� �ٹ��ϴ� �����ȣ
-- �����, ����, �Ի����� ��ȸ �� �� �� ��� ����,

set serveroutput on
set verify off

	accept u_deptno prompt '�μ���ȣ : '
declare
	-- 1. Ŀ������
	cursor cur_emp is
		select empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd')
		from emp
		where	deptno = &u_deptno;
	-- ���ڵ� ���� ����
	type rec_emp is record(
		empno emp.empno%type,
		ename emp.ename%type,
		sal emp.sal%type,
		hiredate varchar2(10)
	);
    
	-- ���̺� ���� (������ó���� �������� �κ��� �и��Ͽ� ����� ����)
	type tab_emp is table of rec_emp index by binary_integer;
	arr_emp tab_emp;
	
	
	emp_data rec_emp;
	-- ������ �� ����
	total_sal number := 0;
begin
	-- 2. Ŀ�� ����
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. ����
	dbms_output.put_line('�����ȣ   �����   ����   �Ի���');
	loop
		fetch cur_emp into emp_data;
		exit when cur_emp%notfound;
		dbms_output.put_line(emp_data.empno||'       '||emp_data.ename||'     '||emp_data.sal||'    '||emp_data.hiredate);
        

		
		total_sal := total_sal + emp_data.sal;
	end loop;
		if cur_emp%rowcount = 0 then
		dbms_output.put_line(&u_deptno||'�� �μ��� �������� �ʰų� ����� �����ϴ�.');
		else
		dbms_output.put_line(&u_deptno||'�� �μ� ����� '||cur_emp%rowcount||' ��');
		dbms_output.put_line('���� �� : '||total_sal);
		end if;
		dbms_output.put_line('������ּż� �����մϴ�.');
	-- 4. Ŀ�� �ݱ�
	close cur_emp;
end;
/
