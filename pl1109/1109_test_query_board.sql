select * from user_procedures;

-- ��Ű���� ���Ե� �Լ� ȣ��
-- ��Ű����.�Լ������� �ۼ��ؾ� ��Ű�� ������ �Լ�, ���ν����� ȣ���!
select test_pack.get_name('������')
from dual;


-- ��Ű���� ���Ե� ���ν��� ȣ��
-- ��Ű����.�Լ������� �ۼ��ؾ� ��Ű�� ������ �Լ�, ���ν����� ȣ���!
var age number;
exec test_pack.get_age(1988, :age);

print age;

-- ����(Random number) : ��ǻ�Ͱ� ������ ���� �����Ͽ� ��ȯ�ϴ� ��.
-- dbms_random.value(����, �Ѱ��) - ���ڿ��� ������ ��� �Լ�
-- 1�������� �����Ͽ� 10 ������ ���� ���
select		trunc(dbms_random.value(1, 10)) /*1~10 ������ ���� ������ ��Ÿ���� �Ѱ���� 10�� ������ �ʴ´�.*/
from		dual;

-- dbms_random.string('����', ��������) - ���ڿ��� ������ ��� �Լ�
-- ���� : u - ������ �빮��, l - ������ �ҹ���, a - ��,�ҹ��� ȥ��, x - �빮�ڿ� ����ȥ��, p - �빮��, �ҹ���, Ư������ ȥ��
select		dbms_random.string('u', 10), dbms_random.string('l', 10), dbms_random.string('a', 10), dbms_random.string('x', 10), dbms_random.string('p', 10)
from		dual;

-- ����� ��, ���� ã�� ��Ű�� ����
-- ����� ��
select		lucky_pack.lucky_num()
from		dual;

-- ����ã��
var name varchar2(30);
execute lucky_pack.lucky_name(:name);

print name;


---

var cur refcursor;
execute lucky_pack.constraints_search('EMP', :cur);

--- �ֹι�ȣ ������ �׽�Ʈ 1.
var ssn_num varchar2(28);
execute lucky_pack.create_ssn(1989, '����', '���ֵ�', :ssn_num);
print ssn_num;

var ssn_num varchar2(28);
execute lucky_pack.create_ssn(1989, '����', '�뱸', :ssn_num);
print ssn_num;

-- �ֹι�ȣ ������ �׽�Ʈ2 (����� �ڵ�)
var ssn char2(14);
execute lucky_pack.create_ssn('880101', '����', '������', :ssn);
print ssn;

select * from class4_info;


select name, ssn, valid_ssn(ssn) from class4_info;


-- 1108 ����12 �׽�Ʈ 1.
var res1;
var res2;
var res3;
execute work12_proc2('EMP', :res1, :res2, :res3);

print res1;
print res2;
print res3;

-- ���� �׽�Ʈ
---------------- �������� �Լ� �׽�Ʈ -------------
select lucky_pack.zodiac_sign('1989')
from dual;       

select		trunc(avg(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')),0)
from		emp
where		deptno = 10
group by deptno;

var msg varchar2;
execute lucky_pack.avg_work(101, :msg);
print msg;


drop trigger event_compare;
select * from user_triggers;


