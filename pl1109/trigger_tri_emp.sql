-- cp_emp ���̺� ���ڵ尡 �߰��Ǹ�
-- cp_emp3 ���̺� �����ȣ, �����, �μ���ȣ, ����, ������ �߰��ϴ� trigger
-- �μ���ȣ�� emp���̺��� �����ȣ�� 7788�� ����� ������ ��ȣ�� �߰�
-- ������ 2000���ϰ� �߰��Ǹ� cp_emp3 ���̺��� ������ 500�� ���Ͽ� �߰��ϴ� trigger �ۼ�

create or replace trigger tri_emp
after insert on cp_emp
for each row

declare
	cp_deptno number;
	cp_job varchar2(20);
	cp_sal number;
begin
	if inserting then
		select		deptno, job
		into		cp_deptno, cp_job
		from      emp
		where		empno=7788;
		
		cp_sal := :new.sal;
		if :new.sal <= 2000 then
			cp_sal := :new.sal + 500;
		end if;
		
		insert into cp_emp3(empno, ename, deptno, job, sal)
		values(:new.empno, :new.ename, cp_deptno, cp_job, cp_sal);
	end if;
end;
/
