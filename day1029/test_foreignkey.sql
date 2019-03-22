-- �ܷ�Ű(foreign key) : �ٸ� ���̺�(�θ�)�� �����θ� ���� �߰��ؾ� �� �� ����Ѵ�.
-- null, �ߺ����� ����Ѵ�. (1 �� �ٰ��踦 ���)

-- �÷����� ������� : foreign key �� ������� �ʴ´�.
-- table_primary ���̺��� id�� �����Ͽ� �����͸� �߰��ϴ�
-- foreign key ����
-- �ڽ� ���̺��� �÷����� ���� �ʿ�� ����, ���������� ũ�⸸ �����ָ� �ȴ�.
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id foreign key
	references table_primary(id),
	tel varchar2(13),
	address varchar2(400)
);
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id
	references table_primary(id),
	tel varchar2(13),
	address varchar2(400)
);

-- �߰� ����
-- �θ����̺� �����ϴ� ������ �߰�

insert into column_foreign(f_id, tel, address)
values('kim', '010-6784-9713','SM');

insert into table_primary(name, id, passwd) values('test', '010-1234-5678', '5678');
select * from table_primary;
commit;

insert into column_foreign(f_id, tel, address)
values('test', '010-6784-9713','����� ������ �ѵ�����');

-- ���� ���̵�� ���� �߰��� �� �ִ�. (�ߺ����)
-- null ���
insert into column_foreign(f_id, tel, address)
values('', '010-6784-9713','����� ������ �ѵ�����');

-- �θ� ���̺� ���� ���� �߰��ϸ� error
insert into column_foreign(f_id, tel, address)
values('kim1', '010-6784-9713','JYP');

-- �θ����̺��� �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �������� �ʴ´�.
savepoint save1;
insert into TABLE_PRIMARY(name, id, passwd) values('��ȣ��','kang','1234');
commit;

-- kang �����ϴ� ���ڵ尡 �������� �����Ƿ� ������ �ȴ�.
delete from table_primary where id='kang';
-- kim �̳� test�� �����ϴ� ���ڵ尡 �����ϹǷ� ���� �Ұ�
delete from table_primary where id='kim';

-- on delete cascade��
-- �����ϴ� �ڽķ��ڵ带 ��� �����ϰ�
-- �θ��ڵ带 �����Ѵ�.
delete from column_foreign where f_id='kim';
delete from table_primary where id='kim';
commit;
-- ���̺� ���� �������
create table table_foreign(
	id					varchar2(20),
	java_score   		number(3),
	oracle_score     number(3),
	constraint	fk_table_foreign_id foreign key(id) references table_primary(id)
);

-- �θ� ���̺� �����ϴ� ������ �߰�
select * from table_primary;
insert into table_foreign(id, java_score, oracle_score) values('kim',97,78);
commit;
insert into table_foreign values('010-1234-5678', 50, 50);
-- null �� �����
insert into table_foreign values('', 100, 98);

-- �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �θ����̺��� �ٷ� ���� �Ұ�
delete from table_primary where id='kim';

select * from table_primary;
insert into table_primary(name, id, passwd) values('���߱�','song','1234');
insert into table_primary(name, id, passwd) values('����','gong','1234');
commit;


-- �θ��ڵ带 �����ϸ� �����ϴ� ��� �ڽ� ���ڵ带
-- �����ϰ� �θ��ڵ带 �����ϴ� on delete cascade ���
create table test_cascade(
	id				varchar2(20),
	address       varchar2(100),
	constraint	fk_test_id		foreign key(id)	references	table_primary(id)
	on delete cascade
);

insert into test_cascade(id, address) values('song', '������ ���ﵿ');
insert into test_cascade(id, address) values('gong', '������ ���ﵿ');
commit;
select * from test_cascade;

-- on delete cascade�� �����Ǹ� �θ� ���ڵ尡 ������ ���,
-- �ڽ� ���ڵ嵵 �Բ� �����ȴ�.
delete from table_primary where id='song';
select * from table_primary;
select * from test_cascade;

delete from table_primary where id='gong';
select * from table_primary;
select * from test_cascade;
-- �ڽ� ���ڵ尡 on delete cacade�� �����Ǿ� ���� ���� ���, �ڽ� ���ڵ忡 ������ �θ� ���ڵ�� ������ �� ����.
-- �� ��� ������ �ڽ� ���ڵ带 ���� ������ ��, �θ� ���ڵ带 �����ؾ� �ùٸ��� �����ȴ�.
delete from table_primary where id='kim';


select * from user_indexes;

x