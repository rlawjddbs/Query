select * from user_constraints;

select * from student;
select * from manager;


-- TEST, STUDENT, SUBJECT
insert into subject(sub_code, title, info)
values('O_000001','����Ŭ','DataBase�� �����ϴ� ���α׷�');
insert into subject(sub_code, title, info)
values('J_000001','�ڹ�','�Ϻ��� OOP���');
commit;

select * from subject;

insert into subject(sub_code, title) values('A0', '');

insert into student(stu_num, name, age, address, email)
values('S_00000001','������',27,'�����','lee@test.com');

select * from student;

-- �÷��� �ٲٱ�
alter table test rename column col to test_num;

insert into test(test_num, sub_code, stu_num)
values(1, 'J_000001','S_00000001');

select * from test;
select * from student;
select * from subject;

-- ȸ������
-- ���̵�(PK), ��й�ȣ(NN), ȸ����(NN), ���ɾ��, ��ȭ��ȣ(UNIQUE),
--�ּ�(NN), �Է���(DEFAULT)

-- �Խ���
-- �۹�ȣ(PK), ����(NN), ����(NN), �ۼ��� id(FK), �ۼ���(DEFAULT), ��ȸ��(DEFAULT 0)

-- �¼�
-- ������ȣ(PK), �¼���ȣ(NN), Ŀ�ü�(check N/Y �ΰ��� ���� �Է°���, default N)

-- ����
-- ���Ű�����ȣ(PK), ���Ź�ȣ, �¼�(����)��ȣ(FK), ȸ�����̵�(FK), ��������(default)

-- ���̺� ���輭, ERD, exerd ������ �������� ���̺� ����

drop table seat;

select * from member;
select * from board;
select * from ticketing;
select * from SEAT;

insert into member(id, pw, name, lang, tel, addr) values('kjy20020', '121212', '������', 'JAVA', '010-2676-0906', '�����');
insert into seat(seat_uq_num, seat_num, couple) values(1, 1, 'Y');
insert into ticketing(tick_uq_num, tick_num, seat_uq_num, id, tick_date) values(1, 1, 1, 'kjy20020', '');
