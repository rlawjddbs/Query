-- 1. �Ʒ��� ���ǿ� �´� ���̺��� �����ϰ� ������ ��������� �ο��� ��
--    ��� �������ǿ� �����ϴ� ���� ������ ��쿡 ���� �����ϴ� ��� �������� �ۼ��ϼ���.

--    �μ���ȣ, �����, ����, �̸���, ��ȭ��ȣ, ����, �ּ�, �Ի���, �����ȣ�� �����ϴ� ���̺��� ����
--
--    �������
--    - �μ���ȣ�� ���� ���ڸ��̸� dept ���̺��� deptno�� �Է��� �� �ִ�.
--    - ������� �����������̰� �ѱ۷� 10���ڱ��� �Է°����ϸ�, �ݵ�� �Է��ؾ� �Ѵ�.
--    - ������ �����̰� �� ������ �Է��� �����ϴ�. �Է°��� ������ 2400~8000���� �Է°���
--    - �̸���, ��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ�.
--    - ������ ���� �Ǵ� ���ڸ� �Է� �����ϴ�.
--    - �ּҴ� ���� ���� �ִ�.
--    - �Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶�� ���� ��¥�� �ԷµǾ�� �Ѵ�.
--    - �����ȣ�� ���� 4�ڸ��̸� null�� ������� �ʰ� �ߺ������͸� ������ �� ����.

-- ��� ������Ȳ�� ������Ȳ�� ���� �������� �ۼ��� ��
-- foregin key�� �ش��ϴ� ��������� ��Ȱ��ȭ ��Ų �� ������ �غ�����.
create table asdf(
	deptno	number(2)			constraint	fk_asdf_deptno references dept(deptno),
	ename	varchar2(30)		constraint fk_asdf_ename not null,
	sal			number(5)			constraint fk_asdf_sal	check(sal between 2400 and 8000) null,
	email		varchar2(96)		constraint fk_asdf_email unique,
	tell		varchar2(13)		constraint fk_asdf_tell unique,
	gen		varchar2(6)			constraint fk_asdf_gen check(gen='����' or gen='����'),
	addr		varchar(102)		constraint fk_asdf_addr null,
	hiredate	date					default sysdate,
	empno	number(4)			constraint fk_asdf_empno PRIMARY KEY
);

-- ����
insert into asdf values(10, 'kim', 8000, 'kim@test.com', '010-1234-5678', '����', '����Ư���� ������ ���ﵿ', sysdate, 1);
-- ����(����� null)
insert into asdf values(20, '', 7999, 'la@test.com', '010-1234-5677', '����', '����Ư���� ������ û�㵿', sysdate, 2);
insert into asdf(deptno, sal, email, tell, gen, addr, hiredate, empno) values(30, 7998, 'bang@test.com', '010-1234-5676', '����', '����Ư���� ������ ��ġ��', sysdate, 3);
-- ����(���� ���� �̸�, �ʰ�)
insert into asdf values(30, 'lee', 2399, 'lee@test.com', '010-1234-5675', '����', '�뱸�� �޼��� ���ε�', sysdate, 4);
insert into asdf values(10, 'dokgo', 8001, 'dokgo@test.com', '010-1234-5674', '����', '�뱸�� �޼��� ������', sysdate, 5);
-- ����(�̸��� null)
insert into asdf values(20, 'kim', 2400, '', '010-1234-5673', '����', '�뱸�� �޼��� ���ε�', sysdate, 6);
-- ����(�̸��� �ߺ�)
insert into asdf values(30, 'yang', 8000, 'kim@test.com', '010-1234-5672', '����', '�泲 ��â�� ��â��', sysdate, 7);
-- ����(��ȭ��ȣ null)
insert into asdf values(20, 'kim', 2400, 'lee@test.com', '', '����', '�泲 ��â�� ��â��', sysdate, 7);
-- ����(��ȭ��ȣ �ߺ�)
insert into asdf values(30, 'hong', 3500, 'hong@test.com', '010-1234-5671', '����', '������', sysdate, 8);
-- ����(���� �Է� error)
insert into asdf values(10, 'ban', 4000, 'ban@test.com', '010-1234-5670', '��', '������', sysdate, 9);
insert into asdf values(20, 'bong', 5000, 'bong@test.com', '010-1234-5669', '��', '��赿', sysdate, 10);
insert into asdf values(30, 'choi', 4600, 'choi@test.com', '010-1234-5668', '����', '������', sysdate, 11);
insert into asdf values(10, 'no', 4070, 'no@test.com', '010-1234-5667', '����', '���', sysdate, 12);
-- ����(�ּ� null)
insert into asdf values(20, 'hwang', 8000, 'hwang@test.com', '010-1234-5666', '����', '', sysdate, 13);
-- ����(��¥ ���� �Է�)
insert into asdf values(30, 'wang', 4000, 'wang@test.com', '010-1234-5667', '����', '������', '2018-10-26', 14);
-- ����(��¥ null)
insert into asdf values(10, 'kang', 4000, 'kang@test.com', '010-1234-5665', '����', '������', '', 15);
insert into asdf(deptno, ename, sal, email, tell, gen, addr, empno) values(20, 'gong', 4120, 'gong@test.com', '010-1234-5664', '����', 'ħ�굿', 16);
-- ����(�����ȣ �ߺ�)
insert into asdf values(30, 'jang', 7777, 'jang@test.com', '010-1234-5663', '����', '��ݵ�', sysdate, 16);
-- ����(�����ȣ null)
insert into asdf values(10, 'cho', 6666, 'cho@test.com', '010-1234-5662', '����', '������', sysdate, '');

-- foreign key ������� ��Ȱ��ȭ
alter table asdf disable constraint fk_asdf_deptno;
-- foreign key ������� ��Ȱ��ȭ �׽�Ʈ
insert into asdf values(77, 'kim', 8000, 'kim1@test.com', '010-2222-6666', '����', '����Ư���� ������ ���ﵿ', sysdate, 18);
-- foreign key ������� ����
alter table asdf drop constraint fk_asdf_deptno;

select * from dept;
select * from asdf;

drop table asdf;
show recyclebin;
