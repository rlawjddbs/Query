-- �̸����� ��ȿ�� ���� 6�� �̻��̸鼭 '@�� .'�� ���ԵǾ��־�� �Ѵ�.
-- ������ ��� '����', '�ݴ��� ��� '����'
create or replace function valid_email(email varchar2)
return char
is
	result_msg char(6) := '��ȿ';
begin
	if length(email) > 6 and instr(email, '@') != 0 and instr(email, '.') <> 0 then
	 result_msg := '��ȿ';
	end if;

	return result_msg;
end;
/
