select rowid, empno from emp;
-- �ε��� ��ȸ
select * from user_indexes;

create table cp_zipcode as (select * from zipcode);

-- ���̺��� ���ڵ� ���� Ȯ��
select count(*) from cp_zipcode;
select count(*) from zipcode;

-- cp_zipcode���̺� seq�÷��� unique index ����
create index idx_zipcode on cp_zipcode(seq);
drop index idx_zipcode;
create unique index idx_zipcode on cp_zipcode(seq);

select * from user_indexes;


-- �ε����� ������� �ʴ� ��ȸ (fullscan : ���������� �ϳ��� �������鼭 ��ü ���ڵ带 �˻�)
select zipcode, sido, gugun, bunji, seq from zipcode where seq=49000;
select 	count(zipcode), zipcode
from		zipcode
group by	zipcode;
where 	zipcode='402-866';
-- �ε����� ����� ��ȸ (���ڵ尡 ���� �� �� ���� �� ������ ���ڵ尡 ���� �� �ξ� ����)
select /*+ ordered index (idx_zipcode)*/zipcode, sido, gugun, bunji, seq from cp_zipcode where seq=4000;
select /*+ ordered index (bit_zipcode)*/zipcode, sido, gugun, bunji, seq from zipcode where zipcode='402-866';
select 	count(zipcode), zipcode
from		zipcode
group by	zipcode;
where 	zipcode='402-866';


-- �����ȣ�� �ߺ������� ��Ư�� ���¸� ������.
-- �ȵż� ����(???)
-- create bitmap index bit_zipcode on cp_zipcode(zipcode);
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- �ε����� ���� ���̺��� ����Ǹ� ��������� �������� �ʴ´�.
-- ���̺�� �ε����� �����ϰ� ���ߴ� ����
alter index idx_zipcode rebuild;
select * from user_indexes;
