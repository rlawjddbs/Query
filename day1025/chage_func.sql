-- ��ȯ �Լ�
-- ���ڿ��� �ƴ� ��(����, ��¥)�� ���ڿ��� ��ȯ
-- ���� -> ������ �ڸ��� ,(��ǥ)�� .(��ħǥ)�� ���

-- ���ϰ��� 0�� �Է��� ���
select		to_char(20181025, '0,000,000,000')
from		dual;

-- ���ϰ��� 9�� �Է��� ���
select		to_char(20181025, '9,999,999,999')
from		dual;

select		to_char(2018.1025, '999,999.999')
from		dual;

-- ������̺��� �����ȣ, �����, �Ի���, ���� ��ȸ
-- ��, ������ �����Ͱ� �ִ� �ͱ����� ,�� �־� ���
select		empno, ename, hiredate, to_char(sal, '9,999,999') as sal
from		emp;

select		to_char(to_date('2018-10-25', 'yyyy-mm-dd'),'mm')
from		dual;

-- to_char �Լ��� ��ȯ�Ǵ� ����� ���ڿ��̹Ƿ� ������� �ʴ´�.
select		to_char(sal, '9,999')+100
from		emp;

-- ��¥ -> ���ڿ� ��ȯ
-- y �ϳ��� �⿡ ���� �ڸ���
select		to_char(sysdate, 'y')
from		dual;

select		to_char(sysdate, 'yy')
from		dual;

select		to_char(sysdate, 'yyy')
from		dual;

select		to_char(sysdate, 'yyyy')
from		dual;

-- m �� yó�� �ϳ��� �� �� ����
select		to_char(sysdate, 'yyyy-mm')
from		dual;

-- ������ ������ �ߺ� ��� ������
select		to_char(sysdate, 'yyyy-mm-yyyy')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd hh')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd hh24')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh')
from		dual;
select		to_char(sysdate, 'yyyy-mm-dd am hh24')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss day')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss dy')
from		dual;

-- pattern�� Ư�����ڰ� �ƴ� ���ڿ� ����Ҷ��� " "�� ���´�.
select		to_char(sysdate, 'yyyy"�� "mm"�� "dd"��" am hh(hh24)"�� "mi"�� "ss"��" dy"����"')
from		dual;

select		to_char(sysdate, 'yyyy"�� "mm"�� "dd"��" am hh(hh24)"�� "mi"�� "ss"��" day')
from		dual;

-- pattern�� �ʹ� ��� ����ϸ� error �߻�
select		to_char(sysdate, 'yyyy " �� " mm " �� " dd " �� " hh24 " �� " mi " �� " ss " �� " ')
from		dual;

-- Į���� �ϳ� �� ����� || �� �ٿ��ָ� ������� ������� ��ȸ ��
select		to_char(sysdate, 'yyyy " �� " mm " �� " dd " �� "') ||
			to_char(sysdate, ' hh24 " �� " mi " �� " ss " �� " ')
from		dual;

-- ��� ���̺��� �����ȣ, �����, �Ի����� ��ȸ
-- ��, �Ի����� '��-��-�� ����'�� �������� ���
select		empno, ename, to_char(hiredate, 'yyyy-mm-dd day')
from		emp;

select		empno, ename, to_char(hiredate, 'yyyy"�� "mm"�� "dd"�� " day')
from		emp;

select		empno, ename, to_char(hiredate, 'yyyy-mm-dd day hh24:mi:ss')
from		emp;

-- ��¥�� ũ��, �۴ٰ� �񱳵ȴ�. (�񱳿����� ��밡��)
-- ��� ���̺��� �Ի�⵵�� '1981'����  ������� �����ȣ, �����, �Ի���, ������ ��ȸ
select 	empno, ename, hiredate, sal
from		emp
where		to_char(hiredate, 'yyyy') = '1981';

select		empno, ename, to_char(hiredate, 'mm"�� "dd"�� �Ի�"') as "81�� �Ի� ����", sal
from		emp
where		to_char(hiredate, 'yyyy') = '1981'
order by hiredate asc;

-- ���� ��¥�� �ƴ� ��¥�� �߰��� ��
-- ��¥ ������ ���ڿ��� �߰��ϸ� �ȴ�.
insert into class4_info(num, name, input_date) values(8, '�缼��', '2018-10-21');
insert into class4_info(num, name, input_date) values(9, '�缼��', to_date('2018-10-21','yyyy-mm-dd'));

select 	to_char(input_date, 'yyyy-mm')
from		class4_info;

-- to_char()�� ��¥�� ���ڸ� �Է¹޾ƾ� �Ѵ�.(�Լ��� ��(����, �Ű����� ��)�� ���������� �����Ѵ�.
-- select		to_char('2018-10-25','mm') error
select		to_char('2018-10-25', 'mm')
from		dual;

select 	to_char(to_date('2018-10-25', 'yyyy-mm-dd'), 'mm')
from		dual;

-- ���� ��ȯ : to_number('���������� ���ڿ�')
-- ex1) '10' �� ���������� ���ڿ��̹Ƿ� 10���� ��ȯ�ȴ�.
-- ex2) '������'�� ���������� ���ڿ��� �ƴϹǷ�  Error�� �߻��Ѵ�.
select		'25'-'10', to_number('25')-to_number('10'),
			to_number('������')
from		dual;

-- --------------------------------------------------------------------------------------------------------------------
-- �����Լ�	:  decode(��, �񱳰�, ��°�, �񱳰�, ��°�, .... �񱳰��� ���� �� ��� ��)
-- --------------------------------------------------------------------------------------------------------------------
-- ��� ���̺��� �����ȣ, �����, ����, �μ��� ��ȸ
-- ��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10 - ���ߺ�, 20 - ����������, 30 - ǰ������ �ַ�� �� �ܿ��� Ź����
select 	empno, ename, sal, deptno, decode(deptno, 10, '���ߺ�', 20, '����������', 30, 'ǰ��������', 'Ź����') as dname
from		emp;

select 		empno, ename, sal, deptno, decode(deptno, 10, '���ߺ�', 20, '����������', 30, 'ǰ��������', 'Ź����') as dname
from			emp
order by     deptno asc;

select 		empno, ename, sal, deptno, decode(deptno, 10, '���ߺ�', 20, '����������', 'Ź����') as dname
from			emp
order by	    deptno asc;

-- �����ȣ, �����, ���ʽ�, �μ���ȣ, ����, �μ�Ƽ�� ��ȸ
-- ��, �μ�Ƽ��� �μ����� �Ʒ��� ǥ�Ͱ��� ��������
-- �����ȣ 10 - ������ 20%, 20 - ������ 50%, 30 - ������ 30% �� �� ������ 5%
select		empno, ename, comm, deptno, sal, decode(deptno, 10, sal * 20 / 100, 20, sal * 50 / 100, 30, sal * 30 / 100, sal * 5 / 100) as incentive
from		emp;

select		empno, ename, comm, deptno, sal, decode(deptno, 10, sal * 0.2, 20, sal * 0.5, 30, sal * 0.3, sal * 5) as incentive
from		emp;
-- PL/SQL ������ decode ��� case�� ����Ѵ�. (PL/SQlL������ decode �� ���� ����)

-- --------------------------------------------------------------------------------------------------------------
-- case
-- ��� ���̺��� �����ȣ, �����, ����, �μ��� ��ȸ
-- ��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10 - ���ߺ�, 20 - ����������, 30 - ǰ������ �ַ�� �� �ܿ��� Ź����
-- ---------------------------------------------------------------------------------------------------------------

select 		empno, ename, sal, deptno,
				case deptno	when	10	then	'���ߺ�'
								when	20	then	'����������'
								when	30	then	'ǰ��������'
								else	'Ź����'
				end as dname
from			emp;

select 		empno, ename, sal, deptno,
				case deptno	when	10	then	'���ߺ�'
								when	20	then	'����������'
								when	30	then	'ǰ��������'
								else	'Ź����'
				end as dname
from			emp
order by     deptno asc;

-- �����ȣ, �����, ���ʽ�, �μ���ȣ, �� ���ɾ� ��ȸ
-- �� ���ɾ��� ���� + ���ʽ� + �μ�Ƽ��� �����ȴ�.
-- �����ȣ 10 - ������ 20%, 20 - ������ 50%, 30 - ������ 30% �� �� ������ 5%

select			empno, ename, sal, deptno,
				case deptno	when 10	then	sal + nvl(comm, 0) + sal * 0.2
								when 20 then	sal + nvl(comm, 0) + sal * 0.5
								when 30 then	sal + nvl(comm, 0) + sal * 0.3
								else sal * 5
				end as total
from 			emp;

select			empno, ename, sal, deptno,
				case deptno	when 10	then	sal + nvl(comm, 0) + sal * 0.2
								when 20 then	sal + nvl(comm, 0) + sal * 0.5
								when 30 then	sal + nvl(comm, 0) + sal * 0.3
								else sal * 5
				end as total
from 			emp
order by		deptno desc;

-- ��� ���̺��� �����ȣ, �����, ������ ��ȸ
-- ��, ������ ù ���ڰ� 'C' - '�ĸ����', 'S' - ������� �ִ� ��, 'M' - ������, 'A' - '���캸�� ���', 'P' - �θ��
select 		empno, ename, job, decode(substr(job,1,1), 'C', '�Ҹ�ǰ', 'S', '������� �ִ� ��', 'M', '������', 'A', '���캸�� ���', 'P', '�θ��') as NICK
from			emp;

select			empno, ename, job,
				case substr(job, 1, 1)	when	'C'	then	'�Ҹ�ǰ'
											when	'S'	then	'������� �ִ� ��'
											when	'M'	then	'������'
											when	'A'	then	'���캸�� ���'
											when	'P'	then	'�θ��'
				end as NICK
from			emp;

select			empno, ename, job,
				case substr(job, 1, 1)	when	'C'	then	'�Ҹ�ǰ'
											when	'S'	then	'������� �ִ� ��'
											when	'M'	then	'������'
											when	'A'	then	'���캸�� ���'
											when	'P'	then	'�θ��'
				end as NICK
from			emp
order by		NICK asc;


select * from emp;
