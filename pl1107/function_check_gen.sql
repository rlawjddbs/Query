--2.  �ֹι�ȣ�� �Է¹޾� ������ ��ȯ�ϴ� �Լ� �ۼ�

create or replace function check_gen(ssn char) return varchar2
is
	gen varchar2(45) := '�ֹι�ȣ ���ڸ��� ��ȿ���� ����';
begin
	if  length(trim(ssn)) = 14 and instr(ssn, '-') = 7 then
		if substr(ssn, 8, 1) in (1, 3, 5, 7) then gen := '����';
		elsif substr(ssn, 8, 1) in (2, 4, 6, 8) then gen := '����';
		end if;	
	end if;
	return gen;
end;
/
