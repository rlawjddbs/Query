-- ��ȸ�Ǵ� ���ڵ��� �Ұ���ȸ
-- ����
-- 1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
--   ��, ��� ��ȣ�� �������� ���� ���� �� 3~5������ ���ڵ常 ��� �ϰ�
--  ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
--  �ش� �ڸ��� ���� ������ 0�� ����Ѵ�. 
select		rownum as rank, empno, ename, sal, bonus
from		(
			select		empno, ename, sal, bonus
			from		emp
			order by	empno desc;
            )

select		sal_rank, empno, ename, to_char(sal,'0,000,000'), bonus
from		(
			select			rownum as sal_rank, empno, ename, sal, bonus
			from			(
							 select			empno, ename, sal, nvl(comm, 0) as bonus
				 			 from			emp
							 order by		empno desc
			)
)
where		sal_rank between 3 and 5;

select		sal_rank, empno, ename, to_char(sal,'0,000,000'), bonus
from		(
			select			rownum as sal_rank, empno, ename, sal, bonus
			from			(
							 select			empno, ename, sal, nvl(comm, 0) as bonus
				 			 from			emp
							 order by		empno desc
			)
)
where		sal_rank=3 or sal_rank=4 or sal_rank=5;

select * from emp;
-- 2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
--   �¾ �ش� ����⵵-����+1 �� ���մϴ�.
select		num, name, age, to_char(sysdate, 'yyyy')-age as born_year
from		class4_info
order by	num asc;

select * from class4_info;

-- 3. class4_info ���̺��� ��ȣ, �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�
--   ��ȸ.
--   ��, �̸����� ��ȿ���� '@' �� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'�����
select num, name, age, email, decode (email_check, 0, '��ȿ', null, '��ȿ', '��ȿ') check_
from(
		select	num, name, age, email, instr(email, '@') as email_check
		from	class4_info
	   );

select num, name, age, email,
		case email_check 	when 0 then '��ȿ'
								when null then '��ȿ'
								else '��ȿ'
		end as check_
from(
		select	num, name, age, email, nvl(instr(email, '@'),0) as email_check
		from	class4_info
	   );
-- 4. car_model ���̺��� �ɼǿ� 'ABS'�� '�����'�� �ִ� ������
--    �𵨸�,���,����,�ɼ�, �̹���, �����縦 ��ȸ �ϼ���.
--    ��, ������ ������������ �����Ͽ� ����� ��
select model, car_year, price, car_option, car_img,
		case model	when 'K5'			then '���'
						when	'�ƹ���'   then '����'
						when '�ҷ���'	then '���'
						when 'A8'		then '�ƿ��'
						when 'ü���'	then '�ֿ�'
						when 'SM7'		then '����Ｚ'
						when 'SM3'		then '����Ｚ'
						when	'�׼�Ʈ'	then '����'
						when 'A4'		then '�ƿ��'
						when '�׷���'	then '����'
						when 'QM5'		then '����Ｚ'
						else '������'
		end as made_in
from	car_model
where	car_option like '%�����%' or car_option like '%ABS%'
order by price asc;

select * from car_model;
-- 5. car_model ���̺��� �𵨸��� '�ƹ���', '�ҷ���', 'A8'�� ������
--    �𵨸�,�𵨺� ���� ���հ� �Ұ�, �Ѱ踦 ��ȸ �ϼ���.
select             model, sum(price)
from				car_model
where				model in ('�ƹ���', '�ҷ���', 'A8')
group by			rollup(model, price);

select             model, sum(price)
from				car_model
where				model in ('�ƹ���', '�ҷ���', 'A8')
group by			rollup(model);

select * from car_model
where model='�ƹ���'
-- 6. car_model ���̺��� ���� ������ 1500~3000 ������ ������
--   �𵨸�, ���, ����, �ɼ�, �Է���, ���ݺ� ������ ��ȸ�ϼ���.
--   ��, ���ݺ� ������ �ߺ����� �ʴ� ��ȣ�� ��µǾ���մϴ�.
select			model, car_year, price, car_option, hiredate, row_number() over(order by price asc)
from			car_model
where			price >= 1500 and price <= 3000;

select			model, car_year, price, car_option, hiredate, row_number() over(order by price asc)
from			car_model
where			price between 1500 and 3000;

-- 7. ��� ���̺��� �Ի�⵵�� 1981�� �̻��̸鼭 �Ŵ����� �ִ�  �����
--   �����ȣ,�����,����,�Ŵ�����ȣ, ���� ������ ��ȸ �ϼ���.
--   ��, ���������� ������ ������ �� ������ ������ �����ݴϴ�.
select			empno, ename, sal, mgr, rank() over(order by sal asc) as sal_rank /*hiredate*/
from			emp
where			to_char(hiredate, 'yyyy') >= 1981;


select * from CAR_MAKER;
select * from CAR_MODEL;
