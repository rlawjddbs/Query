-- group by having
-- having : �׷����� ���� ����
-- ������� 4�� �̻��� �μ��� �μ���ȣ, �����, ������, �ְ����� ��ȸ
select 		deptno, count(deptno), sum(sal), max(sal)
from          emp
group by		deptno
having		count(deptno) >= 4
