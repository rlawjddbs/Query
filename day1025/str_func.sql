-- ���ڿ� �Լ� ���.
-- ���� : length(���ڿ�)
select 'oracle����' || length('oracle') || '��', length('�׽�Ʈ')
from dual;

-- ������̺��� �����, ������� ���ڼ��� ��ȸ
select		ename, length(ename)
from		emp;

-- ��� ���̺��� ������� 4���� ����� ������� ��ȸ
select		ename
from		emp
where		length(ename) = 4;

-- ������̺��� ������� 4���̻� ����� ������� ��ȸ
select		ename
from		emp
where		length(ename) > 4;

-- �빮�� : upper
select		upper('Test'),upper('�׽�ƮAbcdE')
from		dual;

-- �ҹ��� : lower
select		lower('Test')
from		dual;

-- ��� ���̺��� ������� 'scott'�� ����� �����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
select		empno, ename, hiredate, sal
from		emp
where		lower(ename) = 'scott';

select		empno, ename, hiredate, sal
from		emp
where		ename = upper('scott');

-- ��� ���̺��� ������� ��� �ҹ��ڷ�
select		lower(ename) ename
from 		emp;

-- �ε��� ��� : instr(���ڿ�, ã�� ���ڿ�)
select			instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','c'), instr('AbcdeF','D'), instr('AbcdeF','K')
from			dual;
-- ������ instr �Լ��� ����'D' ó�� ��,�ҹ��ڰ� �ȸ°ų� ���� ���ڿ��� �Է��ϸ� ������� ù��° index ��ȣ�� �� ��ȣ�� ���´�. (���⼭�� 0, Ÿ ������ -1)

select * from CLASS4_INFO;
insert into CLASS4_INFO(num, name, email)values(6,'�׽�Ʈ','test@kr');
insert into CLASS4_INFO(num, name, email)values(7,'�׽�Ʈ1','test.kr');
commit;

-- �л� ���̺��� ��ȣ, �̸�, �̸��� ��ȸ
select 	num, name, email
from		class4_info;

select * from class4_info order by num asc;
commit;

-- �л����̺��� ��ȣ, �̸�, �̸���, �̸����� ��ȿ�� ��ȸ
select num,name,email, instr(email,'@'), instr(email,'.')
from class4_info;

-- ���ڿ� �ڸ��� : substr(���ڿ�, �����ε���, �ڸ� ���ڼ�) -----> �ڸ� ���ڼ��� ���� �����ϸ�, ������ �����ε������� �� �κ��� ��� �߷�������.
select		substr('Abcdefg',4,3), substr('Abcdefg',2,5), substr('Abcdefg', 2), substr('Abcdefg', 3), substr('Abcdefg', 5)
from		dual;

-- class4_info ���̺��� ��ȣ, �̸�, �̸��� �÷��� '���� �ּ�'��, '������ �ּҸ�' ��ȸ �ϼ���.
-- test@test.com
select 	num, name, email, substr(email, 1, instr(email, '@')-1) as emailid, substr(email, instr(email, '@')+1) as domain
from		class4_info;


-- �������� : �յ� �������� trim, �� �������� : ltrim, �� �������� : rtrim
select 	'['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']',
			trim('a' from 'aaaaaaaOracleaaaaaa'),
			trim('-' from '----------Oracle----------')
from		dual;

-- ù ���ڸ� �빮�ڷ� : initcap('���ڿ�')
select		initcap('oracle java jsp jQuery SCOTT')
from		dual;

select 	initcap(ename)
from	    emp;

-- ���ڿ� ���̱� : concat('���ڿ�','���Ϲ��ڿ�')
select		concat('ABC','DEF'), concat(concat('ABC','DEF'),'GHI'),
			'ABC'||'DEF'||'GHI'
from		dual;

-- ���ڿ� ä���
-- ���ڿ��� ä�� �� ������ 1byte, �ѱ��� 2byte�� memory�� ������
-- �������� ä��� : lpad('���ڿ�', �� �ڸ���, 'ä�﹮�ڿ�')
select		lpad('ABCDE', 7, '$'), lpad('ABCDEFG', 10, 0)
from		dual;
-- ���������� ä��� : rpad('���ڿ�', �� �ڸ���, 'ä�﹮�ڿ�')
select		rpad('ABCDEF', 10, '��'), rpad('ABC', 10, '#'), rpad('ABC', 10, '��')
from		dual;



select * from class4_info;
