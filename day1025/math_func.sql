-- �����Լ�
select		sin(25), cos(25), tan(25)
from		dual;

-- ���밪 : abs(��)
select		abs(25), abs(-25)
from		dual;

-- �ݿø� : round(��, �ڸ���)
select		round(7777.775, 2), round(777.777, -1)
from		dual;
-- �Ǽ��� �� ���� ���ڸ���, �����δ� ������ �ڸ����� �ٷ� �ݿø� �Ѵ�.)

-- ���� : trunc(��, �ڸ���)
select		trunc(777.777, 2), trunc(777.777, -1)
from		dual;

-- �ø� : ceil (��)
select		ceil(10.1), ceil(10.9)
from		dual;

-- ���� : floor(��)
select		floor(10.9), floor(10.1)
from		dual;

-- ��� ���̺��� �����ȣ, �����, �Ի���, ����, ������ ��ȸ ��, ������ ���� 3.3%�� ����ϰ� �ʴ��� �����Ͽ� ���
select		empno, ename, hiredate, sal, trunc(sal * 3.3 / 100, -1) as tax
from		emp;
