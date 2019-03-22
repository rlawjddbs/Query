create or replace package lucky_pack
as
	-- ����� �� 1~45 �� �ϳ��� ��� ��Ű�� �Լ�
	function lucky_num return number;
	
	-- ���ξ�� ��Ű�� ���ν���
	procedure lucky_name(name out varchar2);    
	
	--------------- 1108_���� constraints_search ���ν���
	procedure constraints_search(tname varchar2, tab_info out sys_refcursor);
	
	-- �������, ����, ������ �Է¹޾� �ֹι�ȣ�� �����Ͽ�
	-- out parameter�� �����ϴ� procedure
	--	procedure create_ssn(birth in varchar2, gender in varchar2, loc in varchar2, ssn out varchar2);

	-- �������, ����, �̸��� �Է¹޾� �ֹι�ȣ�� �����Ͽ�
	-- out parameter�� �����ϰ� class4_info ���̺�
	-- �߰��ϴ� procedure �ۼ�
	procedure create_ssn(birth in varchar2, gender in varchar2, name in varchar2, ssn out char);
	
	
	--����
	--1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� 
	--   �Լ��� �߰��ϼ���.
	--   �� - �¾�ظ� 12�� ���� �������� 
	--   11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����,
	--   2-��,1-��,0-������
	function zodiac_sign(birth varchar2) return varchar2;
	
	--2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
	--   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
	--   �߰��ϼ���.
	procedure avg_work(u_deptno in number, result out varchar2);
end;
/
