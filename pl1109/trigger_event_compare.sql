-- triggering event ��
create or replace trigger event_compare
after insert or update or delete on trigger1
for each row
--	num number;
-- Ʈ���� �ȿ����� ������ ���� �� ����.
-- Ʈ���� �ȿ��� ������ ����� �ʹٸ� declare �� ����� ��.
--declare
--	num number;
begin
	if inserting then
--		dbms_output.put_line('�߰� �۾� �߻�');
		-- trigger1 ���̺� �߰��� �̸�, ����+1 �� ���� trigger2 ���̺� �߰�
		insert into trigger2(name, age) values(:new.name, :new.age+1); 
--		commit;
		-- commit; trigger������ transaction ����� ����� �� ����.
	end if; 
	
	if updating then
--		dbms_output.put_line('���� �۾� �߻�');
		--trigger1 ���̺��� �����۾��� �߻��ϸ�
		--trigger1 ���̺��� ���� �̸��� ���̸� trigger2 ���̺� �߰�
		insert into trigger2(name, age) values(:old.name, :old.age);
	end if;
	
	if deleting then
--		dbms_output.put_line('���� �۾� �߻�');
		-- trigger1 ���̺��� �����۾��� �߻��ϸ�
		-- trigger2 ���̺��� ���� �̸��� ��� ���ڵ带 ����
		delete from trigger2 where name=:old.name;
	end if;
end;
/
