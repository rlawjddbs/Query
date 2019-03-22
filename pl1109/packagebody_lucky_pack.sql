create or replace package body lucky_pack
as
	--------------- lucky_num ���� ------------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1, 46));
	end lucky_num;
	--------------- lucky_num �� ------------------
	
	--------------- lucky_name ���� ------------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30) index by binary_integer;
		name_arr name_tab;
		
		temp_num number;
	begin
		name_arr(1) := '������';
		name_arr(2) := '�̺���';
		name_arr(3) := '������';
		name_arr(4) := '������';
		name_arr(5) := '�ڼҿ�';
		name_arr(6) := '������';
		name_arr(7) := '������';
		
		temp_num := trunc(dbms_random.value(1, name_arr.count+1));
		name := name_arr(temp_num);
	end lucky_name;
	--------------- lucky_name ��----------------- 
	
	--------------- 1108_���� constraints_search ���ν��� ���� --------------------------------------
	procedure constraints_search
	(tname varchar2, tab_info out sys_refcursor)
	is
	
	begin
	open tab_info for
	select   utc.constraint_name,   utc. column_name,
	    	(select distinct data_type 
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
	from user_constraints uc, user_cons_columns utc
	where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='EMP';

	end constraints_search;
	--------------- 1108_���� constraints_search ���ν��� �� -----------------------------------------  
	
	
	
	----------------- �������, ����, ������ �Է¹޾� �ֹι�ȣ�� �����Ͽ� --------------------------
	-------------- out parameter�� �����ϴ� procedure ------------------------------------------------
	--  ���������  880101-1xx1111 ���� xx ���ڸ� �̰� 
	--  �Ʒ��� ǥ�� ����. 
	--  ����� : 00~08
	-- 	�λ�� : 09~12
	--	��õ�� : 13~15
	--	��⵵ : 16~25
	--	������ : 26~34
	--  ��û�� : 35~47
	--	���� : 48~66
	--	��� : 67~92
	--	���ֵ� : 93~95
--	procedure create_ssn
--	(birth in varchar2, gender in varchar2, loc in varchar2, ssn out varchar2)
--	is
--		
--	begin
--		if length(birth_year) = 4 and gen in ('����', '����') and 
--		loc in ('�����','�λ��','��õ��','��⵵','������','��û��','����','���','���ֵ�') then 
--			
--		else ssn := '�̻���';
--		end if;
--		
--	end create_ssn;   
	procedure create_ssn
	(birth in varchar2, gender in varchar2, name in varchar2, ssn out char)
	is
		-- �ֹι�ȣ�� ������ ���̺�
		type ssn_tab is table of number(1) index by binary_integer;
		-- ������ ���̺��� ������ ����
		ssn_arr ssn_tab;
		
		gender_num number := 2;		/*�ֹι�ȣ �⺻�� 2(����)*/
		temp_num number := 0;
		flag_num number := 2;
		temp_ssn varchar2(5);
		
		ssn_value varchar2(14);
	begin
		-- �Է¹��� ��������� ssn_tab�� �߰�
		for i in 1 .. length(birth) loop
			ssn_arr(i) := substr(birth, i, 1);
		end loop;
		
		-- ���� ä���1900��� ������ 2000��� ������ Ȯ��
		if gender = '����' then
			gender_num := 1;
		end if;

		ssn_arr(7) := gender_num;
		
		-- ������ ��° �� ���� ä���.
		-- 880101123456x
		for i in 8 .. 12 loop
			ssn_arr(i) := trunc(dbms_random.value(0, 10), 0);
		end loop;
		
		for i in 1 .. ssn_arr.count loop
			--������ �ֹι�ȣ�� ������ ���ڸ��� ä��� ���� ����
			temp_num := temp_num + ssn_arr(i) * flag_num;
			
			flag_num := flag_num + 1;
			if flag_num = 10 then
				flag_num := 2;
			end if;
		end loop;
		
		-- ä���� ������ ���ڸ� ����
		ssn_arr(13) := mod(11 - mod(temp_num, 11), 10);
		
		ssn_value:= birth||'-'||gender_num||ssn_arr(8)||ssn_arr(9)||ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		-- ������ �ֹι�ȣ�� class4_info�� �߰�
		insert into class4_info(name, ssn)
		values(name, ssn_value);
		
		ssn := ssn_value;
		
		commit;		
	end create_ssn;
    ------------------------------------ �ֹι�ȣ ������ �� -----------------------------------------------  

	------------------------------------ 1109_����.1 �������� �Լ� ���� -----------------------------------------------
	--1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� 
	--   �Լ��� �߰��ϼ���.
	--   �� - �¾�ظ� 12�� ���� �������� 
	--   11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����,
	--   2-��,1-��,0-������  
    function zodiac_sign(birth varchar2) return varchar2
    is
    	re_val varchar2(4); 
    	sign_name varchar2(9);
    	
    begin
    	re_val := mod(birth, 12);
		if re_val = 11 then sign_name := '��'; end if;
		if re_val = 10 then sign_name := '��'; end if;
		if re_val = 9 then sign_name := '��'; end if;
		if re_val = 8 then sign_name := '��'; end if;
		if re_val = 7 then sign_name := '�䳢'; end if;
		if re_val = 6 then sign_name := 'ȣ����'; end if;
		if re_val = 5 then sign_name := '��'; end if;
		if re_val = 4 then sign_name := '��'; end if;
		if re_val = 3 then sign_name := '����'; end if;
		if re_val = 2 then sign_name := '��'; end if;
		if re_val = 1 then sign_name := '��'; end if;
		if re_val = 0 then sign_name := '������'; end if;

		return sign_name;
    end zodiac_sign;
	------------------------------------ 1109_����.1 �������� �Լ� �� --------------------------------------------------      
	
	
	------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------ 1109_����.2 ��� �ټ� ��� ���ν��� ���� --------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------  	
	--2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
	--   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
	--   �߰��ϼ���.
	procedure avg_work(u_deptno in number, result out varchar2)
	is
		temp_avgwork varchar2(8);
	begin
		select		trunc(avg(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')),0)
		into		temp_avgwork
		from      emp
		where		deptno = u_deptno 
		group by deptno;
		
		result := u_deptno||'�� �μ��� ��� �ټӳ���� '||temp_avgwork||'�� �Դϴ�.';
		
		exception 
			when no_data_found then
			result := u_deptno||'���� �ش�Ǵ� �μ��� �����ϴ�!';
	end avg_work;
	------------------------------------ 1109_����.2 ��� �ټ� ��� ���ν��� �� --------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------

end lucky_pack;
/








