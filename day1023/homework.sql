create table home_work(
	num number(5),
	name varchar2(30),
	gen char(2),
	adress varchar2(360),
	score number(3),
	today date
);

insert into home_work values(1, '����ȣ', 'M', '����� ������ ���ﵿ', 64, sysdate);
insert into home_work (num, name, gen, adress, score, today) values(2, '������', 'M', '����� ���α� ������', 87, sysdate);
insert into home_work values(3, '������', 'F', '����� �������� ���ǵ���', 97, sysdate);
insert into home_work (num, name, gen, adress, score, today) values(4, 'Ȳ����', 'M', '����� ���۱� �󵵵�', 100, sysdate);
insert into home_work values(5, '���缮', 'M', '��⵵ ������ ���뱸', 100, sysdate);



update		home_work
set				name='�׽�Ʈ', gen='M'
where         num=3 and score=97;


savepoint	update_u;
update		home_work
set				gen='F'
where			name='���缮';

rollback to update_u;

delete from home_work
where			num=1 and name = '������';

truncate table home_work;
drop table home_work;
show recyclebin;
purge recyclebin;

select * from HOME_WORK;
