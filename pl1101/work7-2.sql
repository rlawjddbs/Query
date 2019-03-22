

set verify off
set serveroutput on
accept u_blood prompt '�������� �Է��ϼ��� : '
accept u_score prompt '������ �Է��ϼ��� : '
accept u_name prompt '�̸��� �Է��ϼ��� : '
accept u_traffic prompt '�̿��ϴ� ��������� �Է��ϼ��� : '
declare
	-- 1�� ���� ����
	blood varchar2(3) := '&u_blood';
	b_ment varchar2(100);
	-- 2�� ���� ����
	score number := &u_score;
	s_ment varchar2(16);
	-- 3�� ���� ����
	name varchar2(45) := '&u_name';
	n_ment char(6);
	l_name varchar2(6);
	f_name varchar2(39);
	-- 4�� ���� ����
	traffic	varchar2(30) := '&u_traffic';
	fee number;
	t_ment1 varchar2(100) := '����ٿ� ����ϴ� ��������� '||traffic||'�̰� �⺻ ���: '||fee||' ���Դϴ�.';
	t_ment2 varchar2(100) := '�պ������ '||(fee*2)||'���̰�, �Ѵ� 20�� ���� ������ '||(fee*40)||'�� �Դϴ�.';

begin
	-- 1. �������� �Է¹޾� �������� Ư¡�� ��� �ϴ� PL/SQL�ۼ�.
	--   -�������� ��ҹ��� ��� �� ���� �ؾ��Ѵ�.
	--   -'A' : �������̴�. ���ɽ�����, �����ϴ�
	--   -'B' : �ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.
	--   -'AB' : �ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�.
	--   -'O' :  �Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�
	if blood in ('A', 'B', 'AB', 'O') then
		if blood = 'A' then
		b_ment := '�������̴�. ���ɽ�����, �����ϴ�.';
        elsif blood = 'B' then
        b_ment := '�ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.';
        elsif blood ='AB' then
        b_ment := '�ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�.';
        else b_ment := '�Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�.';
        end if;
	dbms_output.put_line(blood||'�� Ư¡ : '||b_ment);
	elsif blood in ('a', 'b', 'ab', 'o') then
	dbms_output.put_line('�������� �빮�ڷ� �Է��� �ּ���.');
	else dbms_output.put_line('** ERROR : ������ �������� �ʴ� ������ �Դϴ�..');
	end if;
	--	 2. ������ �Է¹޾Ƽ�
	--     100~90 ���̸� 'A'����
	--     89~80 ���̸� 'B'
	--     79~70 ���̸� 'C'
	--     69~60 ���̸� 'D'
	--    �׿� ��� '����� ����' �� ����ϴ�  PL/SQL�� �ۼ��ϼ���.
	if score between 0 and 100 then
		if score between 90 and 100 then s_ment := 'A����';
			elsif score between 80 and 89 then s_ment := 'B����';
			elsif score between 70 and 79 then s_ment := 'C����';
			elsif score between 60 and 69 then s_ment := 'D����';
			else s_ment := '����� ����';
		end if;
		dbms_output.put_line(s_ment);
	else dbms_output.put_line('** ERROR : 0 ~ 100 ������ ������ �Է��ϼ���');
	end if;
	-- 3. �̸��� �Է¹޾� ���� �̸��� ����ϴ�  PL/SQL�� �ϼ���.
	--    �̸��� ���ڼ��� 3�� ���϶�� '�ܼ�'���� �Ǵ��ϰ� 4�� �̻��̶��
	--    '����' �̶�� �Ǵ��Ѵ�.
	--    �ܼ�- ���� �ϳ��� �� (��: ��,��,��,��),
	--    ���� - ���� �ΰ��μ� (�� : ������, �簥���� ��)
	--    �����  ��: ��  �̸� : ��ö
	if length(name) > 3 then
		n_ment := '����';
		l_name := substr(name, 1, 2);
		f_name := substr(name, 3);
	elsif length(name) <= 3 and length(name) >= 2 then
		n_ment := '�ܼ�';
		l_name := substr(name, 1, 1);
		f_name := substr(name, 2);
	else dbms_output.put_line('** ERROR : �߸��� �̸� �Է��Դϴ�.');
	end if;
	 dbms_output.put_line(name||'���� '||n_ment||'�̸�');
	 dbms_output.put_line('�� :'||l_name||', �̸� : '||f_name||' �Դϴ�.');

-- 4. ��������� �Է¹޾�, '�ý�','����','����ö' �� ��쿡��
--   �Ʒ��� ���� ������� �Ѵ� ����� �����ϼ���.
--   �ý� : 3800 -
--   ���� : 1200
--   ����ö :1250��
--   ��� : ����ٿ� ����ϴ� ��������� 'XX'�̰� �⺻ ���: xx ���Դϴ�.
--   �պ������ xx���̰�, �Ѵ� 20�� ���� ������ xx�� �Դϴ�.
--   �ý�, ����, ����ö�� �ƴ϶��  '���߱����� �ƴմϴ�.' �� ����ϼ���.
	if traffic= '�ý�' or traffic = '����' or traffic = '����ö' then
		if traffic= '�ý�' then dbms_output.put_line('����ٿ� ����ϴ� ��������� '||traffic||'�̰� �⺻ ���: 3,800���Դϴ�.');
		elsif traffic= '����' then dbms_output.put_line('����ٿ� ����ϴ� ��������� '||traffic||'�̰� �⺻ ���: 1,200���Դϴ�.');
		else dbms_output.put_line('����ٿ� ����ϴ� ��������� '||traffic||'�̰� �⺻ ���: 1,250���Դϴ�.');
		end if;           
	else dbms_output.put_line('���߱����� �ƴմϴ�.');
	end if;

end;
/
