/*
	test_proc ���̺��� ��� ��� ������ ��ȸ�Ͽ� out_parameter�� �����ϴ� procedure
*/
create or replace procedure select_all_test_proc
( cur_emp out sys_refcursor, date_pattern in varchar2 )
is           

begin
	open cur_emp for
	select empno, ename, to_char(hiredate, date_pattern) as hiredate, sal, job
	from test_proc;
end;
/
