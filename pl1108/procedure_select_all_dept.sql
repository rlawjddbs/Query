-- Procedure �ȿ��� �������� ��ȸ�� ��
-- dept ���̺��� ��� �μ������� ��ȸ�Ͽ� out parameter��
-- �����ϴ� procedure
create or replace procedure select_all_dept
(cur_dept out sys_refcursor)
is
--	dept_data dept%rowtype;
begin
	open cur_dept for
		select deptno, dname, loc
		from	dept;
	-- sys_refcursor�� ����� ���� �ܺο��� ����� �� �ֵ���
	-- Ŀ���� ������ procedure ������ �������� �ʴ´�.
	
--	loop
--		fetch cur_dept into dept_data;
--		exit when cur_dept%notfound;
--	end loop;
--	
--	close cur_dept;
end;
/
