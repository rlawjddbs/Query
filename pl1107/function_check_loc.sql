create or replace function check_loc(ssn char) return char
is 
	loc char(9);
begin
	if length(trim(ssn)) = 14 and instr(ssn, '-') = 7 then
		if substr(ssn, 9, 2) between 0 and 8 then
			loc := '�����';
		elsif substr(ssn, 9, 2) between 9 and 12 then
			loc := '�λ��';
		elsif substr(ssn, 9, 2) between 13 and 15 then
			loc := '��õ��';
		elsif substr(ssn, 9, 2) between 16 and 25 then
			loc := '��⵵';
		elsif substr(ssn, 9, 2) between 26 and 34 then
			loc := '������';
		elsif substr(ssn, 9, 2) between 35 and 47 then
			loc := '��û��';
		elsif substr(ssn, 9, 2) between 48 and 66 then
			loc := '����';
		elsif substr(ssn, 9, 2) between 67 and 92 then
			loc := '���';
		elsif substr(ssn, 9, 2) between 93 and 95 then
			loc := '���ֵ�';
		else loc := '�Ͽ���';	
		end if;
   	end if;	
   	return loc;
end;
/
