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
	
	i number := 0;
begin
	-- 2. Ŀ�� ����
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. ����
	loop
		fetch cur_emp into emp_data;
		
		exit when cur_emp%notfound;
		-- ������ ó��
		i := i+1;
		arr_emp(i) := emp_data;
	end loop;
	
	if arr_emp.count != 0 then
	-- if i != 0 then �� ����.
		dbms_output.put_line('�����ȣ   �����   ����   �Ի��� ');
		for idx in 1 .. arr_emp.count loop
			dbms_output.put_line(arr_emp(idx).empno||'       '||arr_emp(idx).ename||'     '||arr_emp(idx).sal||'    '||arr_emp(idx).hiredate);       		
			total_sal := total_sal + arr_emp(idx).sal;
		end loop;
--		dbms_output.put_line(&u_deptno||'�� �μ� ����� '||cur_emp%rowcount||' ��');
		dbms_output.put_line(&u_deptno||'�� �μ� ����� '||arr_emp.count||' ��');
		dbms_output.put_line('���� �� : '||total_sal);   
	elsif cur_emp%rowcount = 0 then
		dbms_output.put_line(&u_deptno||'�� �μ��� �������� �ʰų� ����� �����ϴ�.');		
	end if;
		dbms_output.put_line('������ּż� �����մϴ�.');
	-- 4. Ŀ�� �ݱ�
	close cur_emp;
end;
/
