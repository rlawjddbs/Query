-- ���̺� ���ڵ� (row) �߰�
-- �÷����� �����ϴ� ���.
-- insert into Class4_info values (NUM, �̸�, �ֹι�ȣ, ����, �÷�, �̸���, �ۼ���);


insert into Class4_info values(1, '���ü�', '880101-1234567', 31, 1.3, 'jung@sist.co.kr', sysdate);
commit;

insert into Class4_info values(2, '880101-1234567', '�ü�', 26, 1.3, 'jung@sist.co.kr', sysdate);
commit;


-- �÷��� ����Ͽ� �߰��ϱ� ��
-- �÷��� ���� ������ ���̺��� ���ǵ� �÷��� ������ �ٸ��� �ۼ����ɡ�
insert into Class4_info(num, name, ssn, age, eye, email, input_date) values(3, '������', '880101-1234568', 26, 1.3, 'jung@sist.co.kr', sysdate);


-- �Ǽ��� 0.8�� ǥ����� �ʰ� .8�� ��Ÿ����
insert into Class4_info(name, email, num, ssn, age, input_date, eye) values('������', 'oh@test.com', 4, '890101-1234567', 28, sysdate, 0.8);
commit;

/* �� �ڵ�� insert ���� �ϳ��� commit ���� ����ó�� �ߴ�. */



-- �÷��� �����ϸ� null�� �Էµȴ�.
insert into class4_info(num, name, age) values(5, '������', 20);
commit;

-- �� �ڵ���� ��������� ���� ������ �ߺ��� ���� �� �ִ�.
-- insert�� �� ���ڵ徿 ������� �� �ִ�.
select * from CLASS4_INFO;
