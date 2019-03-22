-- �����ȣ, �����, �μ���ȣ, ������ �Է¹޾� cp_emp3 ���̺�
-- �߰��ϴ� PL/SQL �ۼ�
-- ��, ����� ������ �μ���ȣ�� ���� ���� �������� �߰��Ѵ�.
-- 10�� �μ� : emp ���̺��� �����ȣ�� 7566�� ����� ���� ��������,
-- 20�� �μ� : emp ���̺��� �����ȣ�� 7698�� ����� ���� ����,
-- 30�� �μ� : emp ���̺��� �����ȣ�� 7782�� ����� ���� ����,
-- �׿� �μ���ȣ�� �ԷµǸ� emp���̺��� 7788����� �������� �߰�

set verify off
set serveroutput on
accept u_empno prompt '�����ȣ : '
accept u_ename prompt '����� : '
accept u_deptno prompt '�μ���ȣ : '
accept u_job prompt '���� : '

declare
	i_empno cp_emp3.empno%type := &u_empno;
	i_ename cp_emp3.ename%type := '&u_ename';
	i_deptno cp_emp3.deptno%type := &u_deptno;	
	i_job cp_emp3.job%type := '&u_job';
	
	i_sal cp_emp.sal%type;
	select_empno cp_emp.empno%type := 7788;
begin
	-- �ԷµǴ� �μ���ȣ���� ������ ������ ������ ��ȸ�ϱ� ����
	-- �����ȣ�� ����
	if i_deptno = 10 then 
		select_empno := 7566;
	elsif i_deptno = 20 then
		select_empno := 7698;
	elsif i_deptno = 30 then
		select_empno :=7782;
	end if;
	
	-- ������ �����ȣ ���� ������ ��ȸ
	select	sal
	into 	s_sal
	from	emp
	where empno = select_empno;
	
	-- ��ȸ�� �������� �߰� �۾�
	insert into cp_emp3(empno, ename, deptno, job, sal) values(i_empno, i_ename, i_deptno, s_job, i_sal);
	
	dbms_output.put_line(i_empno||'�� ��� ������ �߰��Ͽ����ϴ�.');
	commit;
end;
/
