-- �����ȣ, �����, ������ �Է¹޾� �����ȣ�� ��ġ�ϴ� �����
-- ������ ������� CP_EMP2 ���̺��� �����Ѵ�.
-- ��, ������ 3000������ �� 1000�� ���� �������� �����Ѵ�.

set verify off
set serveroutput on

accept empno1 prompt '�����ȣ : '
accept ename1 prompt '����� : '
accept sal1 prompt '���� : '

declare
	i_empno cp_emp2.empno%type := &empno1;
	i_ename cp_emp2.ename%type := '&ename1';
	i_sal number := &sal1;
	
	cnt number;
begin
    if i_sal <= 3000 then 
    	i_sal := i_sal + 1000;  
    end if;
    -- update�� set�� where���� �������� �÷���� ���е� �� �ֵ���
    -- �̸��� �ٸ��� �Ͽ� �ۼ��ؾ� �Ѵ�.
    update cp_emp2
    set sal = i_sal, ename = i_ename
    where empno = i_empno;
    
    cnt := sql%rowcount;
    
    dbms_output.put_line(cnt||'�� ����');
    
    if cnt = 1 then
    	dbms_output.put_line(cnt||'���� ���� �Ǿ����ϴ�.');
    	commit;
    else
    	dbms_output.put_line(cnt||'���� ���� 1���� �ƴϹǷ� �����۾��� ����մϴ�.');
    	rollback;
    end if;
end;
/