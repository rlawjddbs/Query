--Transaction ���
-- savepoint�� �����Ͽ� Ư�� �������� �۾� ���
-- Transaction�� �������� ������ �̷���� ��� savepoint�� ����ϸ� �ȴ�.

savepoint insert_a;
insert into class4_info(num, name, email)
values(21, '�׽�Ʈ','test@test.com');

savepoint insert_b;
insert into class4_info(num, name, email)
values(22, '�׽�Ʈ1','test@test.com');

savepoint update_c;
update	class4_info
set	name='����3'
where	num=22;

savepoint delete_d;
delete from class4_info
where num=22;

-- Ư�� �۾� ������ commit �ϸ� �ѹ� �Ұ���

-- rollback to delete_d;
-- rollback to update_c;
-- ���� ���� ���ƿø� �� �ִ�. (== ���伥 -> Ư�� �����丮 �������� �۾����)