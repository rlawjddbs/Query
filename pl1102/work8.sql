--���� .
--
--1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
--   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������
--   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� �� 4Ű�θ���
--  100���� ��� �� �ΰ��ȴ�.
--  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
--  ������.
-- 1, ������, ����� ������ ���ﵿ, 5Ű��, ����
--  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
--  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
--  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
--  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����
--
--   ���
--   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, ���

--	���� 2.
--	�л����� ������ ó���ϴ� PL/SQL�ۼ�.
--  ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� �� ������ ���ִ� record��
--  ����� �Ʒ��� �����͸� �Է��� ��
--  �ݺ����� ����Ͽ�  ����,����� ó���ϴ� PL/SQL �ۼ�
-- 	1, ������, 80,81
--  2, ����ö, 94,80
--  3, ������, 97,96
--  4, �ڿ���, 86,92
--  5, ���ü�, 76,99
--
-- 	���
--  ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,���
--  .
--  .
--  .
--  �ڹ��ְ����� [xx] ����Ŭ �ְ����� [xxx]

-- 3. �Ʒ��� �����͸� ó���ϴ�  PL/SQL�ۼ�
--    "�̸�, �ֹι�ȣ, ����, ����"�� ������ �� �ִ� ���̺���
--    �����ϰ� �Ʒ��� �����͸� ä���.
--   ������, 880101-1234567
--   ����ö, 890101-1234567
--   ������, 011231-3234567
--   �ڿ���, 920101-2234567
--   ���ü�, 020420-4234567
--   ���� �����͸� ����Ͽ�
--   ��ȣ,�ֹι�ȣ,����, ������ �����ִ�  PL/SQL�� �ۼ��ϼ���.


--set verify off /* ������Ʈ �����ϹǷ� �ּ�ó�� */
set serveroutput on
declare
	-- 1�� ���� ----------------------------------------------------------------
	type stu_record is record(
	num number,
	name varchar2(30),
	addr varchar2(35),
	km number,
	traffic varchar2(9)
	);
	type stu_table is table of stu_record index by binary_integer;
	class4_tab stu_table;

	traf number;
	addtax number;
	-- 1�� ���� �� -------------------------------------------------------------
	-- 2�� ���� ----------------------------------------------------------------
	type stu_record2 is record(
	num number,
	name varchar2(30),
	o_score number,
	j_score number
	);
	type stu_table2 is table of stu_record2 index by binary_integer;
	class4_tab2 stu_table2;
	total number;
	o_high number;
	j_high number;
	-- 2�� ������ -------------------------------------------------------------
	-- 3�� ���� ----------------------------------------------------------------
	type people_record is record(
	name varchar2(30),
	ssn char(14),
	age number(3),
	gen char(6)
	);
	type people_tab is table of people_record index by binary_integer;
	people people_tab;
	-- 3�� ������ -------------------------------------------------------------
begin
	dbms_output.put_line('=============================================================================');
	-- 1�� ���� ----------------------------------------------------------------
	class4_tab(1).num := 1;
	class4_tab(1).name := '������';
	class4_tab(1).addr := '����� ������ ���ﵿ';
	class4_tab(1).km := 5;
	class4_tab(1).traffic := '����';

	class4_tab(2).num := 2;
	class4_tab(2).name := '����ö';
	class4_tab(2).addr := '��õ�� ������ ������';
	class4_tab(2).km := 20;
	class4_tab(2).traffic := '����ö';

	class4_tab(3).num := 3;
	class4_tab(3).name := '������';
	class4_tab(3).addr := '��õ�� ���� ����';
	class4_tab(3).km := 16;
	class4_tab(3).traffic := '����ö';

	class4_tab(4).num := 4;
	class4_tab(4).name := '�ڿ���';
	class4_tab(4).addr := '����� ���Ǳ� ��õ��';
	class4_tab(4).km := 10;
	class4_tab(4).traffic := '����ö';

	class4_tab(5).num := 5;
	class4_tab(5).name := '���ü�';
	class4_tab(5).addr := '����� ���빮�� ���빮��';
	class4_tab(5).km := 8;
	class4_tab(5).traffic := '����';

	traf := 0;
	addtax := 0;
	for i in 1 .. class4_tab.count loop
		if class4_tab(i).traffic = '����' then traf := 1200;
		elsif class4_tab(i).traffic = '����ö' then traf := 1250; end if;

		if class4_tab(i).km > 10 then
		addtax := substr(((class4_tab(i).km - 10) / 4), 1, 1) * 100;
		end if;

		dbms_output.put_line(class4_tab(i).num||',  '||class4_tab(i).name||',  '||class4_tab(i).addr||',      '||
		class4_tab(i).km||',  '||class4_tab(i).traffic||'  '||to_char(traf,'999,999')||'  '||to_char(traf+addtax, '999,999'));
		addtax := 0;
    end loop;

	-- 1�� ���� �� -------------------------------------------------------------

	dbms_output.put_line('=============================================================================');


	-- 2�� ���� ----------------------------------------------------------------
		class4_tab2(1).num := 1;
		class4_tab2(1).name := '������';
		class4_tab2(1).o_score := 80;
		class4_tab2(1).j_score := 81;
		class4_tab2(2).num := 2;
		class4_tab2(2).name := '����ö';
		class4_tab2(2).o_score := 94;
		class4_tab2(2).j_score := 80;
		class4_tab2(3).num := 3;
		class4_tab2(3).name := '������';
		class4_tab2(3).o_score := 97;
		class4_tab2(3).j_score := 96;
		class4_tab2(4).num := 4;
		class4_tab2(4).name := '�ڿ���';
		class4_tab2(4).o_score := 86;
		class4_tab2(4).j_score := 92;
		class4_tab2(5).num := 5;
		class4_tab2(5).name := '���ü�';
		class4_tab2(5).o_score := 76;
		class4_tab2(5).j_score := 99;

	total := 0;
	o_high := class4_tab2(1).o_score;
	j_high := class4_tab2(1).j_score;
	for idx in 1 .. class4_tab2.count loop
		total := total + class4_tab2(idx).o_score + class4_tab2(idx).j_score;
		dbms_output.put_line(class4_tab2(idx).num||'  '||class4_tab2(idx).name||'  '||class4_tab2(idx).o_score||'  '||
		class4_tab2(idx).j_score||'  '||total||'  '||(total/2));
    	total := 0;

    	if o_high < class4_tab2(idx).o_score then o_high := class4_tab2(idx).o_score; end if;
    	if j_high < class4_tab2(idx).j_score then j_high := class4_tab2(idx).j_score; end if;
	end loop;
	dbms_output.put_line('�ڹ��ְ� ����['|| j_high ||'] ����Ŭ �ְ� ����['|| o_high ||']');
	-- 2�� ������ -------------------------------------------------------------
	dbms_output.put_line('=============================================================================');
	-- 3�� ���� ----------------------------------------------------------------
	people(1).name := '������';
	people(1).ssn := '880101-1234567';
	people(2).name := '����ö';
	people(2).ssn := '890101-1234567';
	people(3).name := '������';
	people(3).ssn := '011231-3234567';
	people(4).name := '�ڿ���';
	people(4).ssn := '920101-2234567';
	people(5).name := '���ü�';
	people(5).ssn := '020420-4234567';


	for pnum in 1 .. people.count loop
		if substr(people(pnum).ssn, 8, 1) = 3 or substr(people(pnum).ssn, 8, 1) = 4 then
		people(pnum).age := to_number(to_char(sysdate, 'yyyy')) - (2000 + to_number(substr(people(pnum).ssn, 1, 2))) + 1;
		else people(pnum).age := to_number(to_char(sysdate, 'yyyy')) - (1900+ to_number(substr(people(pnum).ssn, 1, 2)))+ 1	;
		end if;
		
		if substr(people(pnum).ssn, 8, 1) in ('1', '3') then people(pnum).gen := '����';
		elsif substr(people(pnum).ssn, 8, 1) in ('2', '4') then people(pnum).gen := '����'; end if;

		dbms_output.put_line(people(pnum).name||', '||people(pnum).ssn||', '||people(pnum).age||'��, '||people(pnum).gen);
	end loop;
	-- 3�� ������ -------------------------------------------------------------
end;
/

