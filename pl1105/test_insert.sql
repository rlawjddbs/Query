-- PL/SQL���� DML(Data Manipulation Language) ���

set serveroutput on

declare

begin
       insert into cp_emp3(empno, ename, deptno, job, sal) values(3333, '���缮', 10, '����� ����', 8000);
		
		-- ������ ���� �� ��� : �Ͻ���(������) Ŀ�� ���
		-- sql(�Ͻ��� Ŀ��)%rowcount
		


		-- insert�� �߰� ���� �ƴϸ� ���ܰ� �߻��ϰ� �ǹǷ� �Ͻ��� Ŀ���� ����Ͽ�
		-- �߰��� ���� ���� ��� ���� �ʿ䰡 ����.		
		commit;
		dbms_output.put_line( sql%rowcount||'�� �߰�' ); 
		--		if sql%rowcount = 1 then 
		--			commit;
		--			dbms_output.put_line( sql%rowcount||'�� �߰�' ); 
		--		else
		--			rollback;
		--		end if;
		
		exception
		when others then
		dbms_output.put_line('���� �߻�');
end;
/

--commit;
--select * from cp_emp3;
--delete cp_emp3 where empno=3333;


