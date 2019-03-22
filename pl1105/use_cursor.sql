-- �������� ��ȸ�� �� ����ϴ� cursor
-- dept ���̺��� ��� ���ڵ带 ��ȸ�ϴ� cursor


set serveroutput on

declare
	-- 1. ���� : cursor Ŀ���� is select ... ; 
	cursor cur_dept is
		select deptno, dname, loc
		from dept;
	-- ��ȸ����� ������ ���� ����
		-- 1-1. ���� ��ƺ���
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;
		-- 1-2. �ѹ��� ��ƺ���	
	dept_data dept%rowtype;
begin
	-- 2. ����
	open cur_dept;
--	close cur_dept;
    if cur_dept%isopen then
    	-- Ŀ���� ���� �ִٸ� ���� Ŀ���� �ݰ�
    	dbms_output.put_line('Ŀ���� ��������');
    else
    	dbms_output.put_line('Ŀ���� ��������');
    end if;
    
    -- 3. ���� : �ݺ�
--    fetch cur_dept into deptno, dname, loc; 
--    fetch cur_dept into deptno, dname, loc;
--    fetch cur_dept into deptno, dname, loc; 
--    fetch cur_dept into deptno, dname, loc;  
      loop
-- 		3-1. into ���� ���� ������ ����Ͽ� ó��
--		fetch cur_dept into deptno, dname, loc;
-- 		if cur_dept%notfound then
--  	dbms_output.put_line('���ڵ� ����');
-- 		exit�� ���� ������ �ִ� loop�� ����������.
--		exit;
--		else
--		dbms_output.put_line('���ڵ� ����');

--		end if;  	      	                               
--		dbms_output.put_line( deptno||' '||dname||' '||loc );

-- 		3-2. into ���� ���ڵ� ������ ����Ͽ� ó��
		fetch cur_dept into dept_data;
	    exit when cur_dept%notfound;
		dbms_output.put_line( dept_data.deptno||' '||dept_data.dname||' '||dept_data.loc );
		
      end loop;
      dbms_output.put_line('��ȸ�� ���ڵ� �� : '||cur_dept%rowcount);
		
     -- 4. Ŀ�� �ݱ�
     close cur_dept;

end;
/
