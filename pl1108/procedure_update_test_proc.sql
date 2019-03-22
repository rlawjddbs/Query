-- �����ȣ, ����, ������ �Է¹޾� test_proc ���̺���
-- �����ϴ� procedure

-- 1. ������ ���, ����, �븮, ����, ����, ����, �̻�, ��, ������ �Է� �Ǿ������� �����Ѵ�.
-- 2. ������ ���� �������� �۴ٸ�  ���� �������� 5% �λ������ �����Ѵ�.

create or replace procedure update_test_proc
	(i_empno number, i_job varchar2, sal number, 
	row_cnt out number, result_msg out varchar2)
is
	temp_sal number;
		
begin
	row_cnt := 0;
	--1. ���޿� ���� ó��
	if i_job in ('���', '����', '�븮', '����', '����', '����', '�̻�', '��', '����', '��ǥ�̻�') then
		--2. ���� �������� �۴ٸ� 
			-- select ������ ��ȸ�� �� ������ ������� temp_sal ������ �Ҵ��Ѵ�.
		select	sal
		into	temp_sal
		from	test_proc
		where	empno = i_empno;
		-- �� ������ �Էµ� ������ ���Ѵ�. (�Էµ� ������ �� �������� ���� ��� �� �������� 5% �λ�)
		if sal < temp_sal then
			temp_sal := trunc(temp_sal + temp_sal * 0.05);
		else
			temp_sal := sal;
		end if;
		
		update	test_proc
		set			job = i_job, sal=temp_sal
		where		empno = i_empno;
		
		row_cnt := sql%rowcount;
		
		commit;
		result_msg := i_empno||'�� ����� ������ ����Ǿ����ϴ�. ���ÿ��� : '||sal||
		', Ȯ�� ���� : '||temp_sal;
		
	else
		result_msg := i_job||'�� �系 ������ �ƴմϴ�.';
	end if; 
	
	exception
	when no_data_found then
		result_msg := i_empno||' �� ����� �������� �ʽ��ϴ�.';
	when others then
		result_msg := sqlerrm;
end;
/
