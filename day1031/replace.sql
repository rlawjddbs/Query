-- replace :���� ġȯ�ϴ� ���ڿ� �Լ�
-- replace(����ڿ�, '�����ϰ� ��������', '������ ����')

select		replace('������ ����� �Դϴ�.','������','������')
from		dual;

select		replace('���ü�, ������, ������, ����ö','������','��õ���� �ڶ� ���� ������')
from		dual;

select * from user_objects;

drop table zipcode;
drop table cp_zipcode;

drop table emp;
purge recyclebin;

select * from zipcode;
