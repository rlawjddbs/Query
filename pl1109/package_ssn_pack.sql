create or replace package ssn_pack
as
	-- �ֹε�Ϲ�ȣ�� �����ϴ� ���ν���
	-- �������, ����, ������ �Է¹޾� �ֹι�ȣ�� �����Ͽ�
	-- out parameter�� �����ϴ� procedure
	procedure create_ssn(birth char, gen char, loc varchar2, ssn out char);
	
end;
/
