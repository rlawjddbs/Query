------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ������ �ѹ� ����� ��
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
update		car_model
set				car_img='qm5_001.jpg'
where			car_img='qm5_001.jpg,qm5_002.jpg';
update		car_model
set				car_img='qm5_003.jpg'
where			car_img='qm5_003.jpg,qm5_004.jpg';
update		car_model
set				car_img='qm5_005.jpg'
where			car_img='qm5_005.jpg,qm5_006.jpg';
commit;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from car_country;
select * from car_maker;
select * from car_model;
-- http://www.gurubee.net/lecture/1021 �����Ͽ� SQL �ƿ��� ���� �����غ� ��!

--����.
--1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
--    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
--   ��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
--     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
--     �Է����� ��-��-�� �� �������� ��� �Ұ�.
select				rank, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
from				(
					select				rownum as rank, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
					from				(
										select				cc.country, cc.maker, cma.model, to_char(cmo.car_year,'9,999,999') as car_year, to_char(cmo.price,'9,999,999') as price, cmo.car_img, to_char(cmo.hiredate,'mm-dd-yyyy') as hiredate, cmo.cc, substr(cmo.car_option, 1, instr(cmo.car_option, ',')) as car_option
										from				car_country cc, car_maker cma, car_model cmo
										where				(cc.maker = cma.maker and cma.model = cmo.model) and cmo.cc >= 1500 and cmo.cc <= 3000
										order by			cmo.cc desc
					                    )
                    )
where				rank >= 3 and rank <= 6;

--2. �μ���ȣ�� 10�� 30,40���� ��� �μ��� �����ȣ,�����,�Ի���,
--   ����,��������,�μ���,�μ���ȣ,��ġ, �����ȣ,�õ�, ����,��,���� �� ��ȸ.
--  ��,����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
--  �����ȣ�� '-' �ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü
--  �Ͽ� ��� ,�Ի����� ��-��-�� ���ϱ��� ���
select			no, empno, ename, hiredate, sal, sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, nvl(bunji, '��������') as bunji
from			(
				select			rownum as no, empno, ename, hiredate, sal, sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
				from			(
								select			empno, ename, hiredate, sal, rownum as sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
								from			(
												select 		e.empno, e.ename, e.hiredate, e.sal, d.dname, d.deptno, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji
												from	        emp e, dept d, zipcode z
												where			(e.deptno(+) = d.deptno and z.seq=e.empno) and e.deptno in (10, 30, 40)
												order by		sal desc
				                				)
								order by		empno asc
								)
				)
where			no >= 2 and no<=5;

--3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
-- �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ
--  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����
--   �Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
--   ��������� ������ Bmw, Audi �� �������� ��� .
select			cc.country, initcap(cc.maker) as maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, substr(cmo.car_img, 1, instr(cmo.car_img, '.')-1) as img_name, substr(cmo.car_img, instr(cmo.car_img, '.')+1) as img_format ,cmo.cc
from			car_country cc, car_maker cma, car_model cmo
where			((cc.maker = cma.maker(+)) and (cma.model = cmo.model)) and cma.maker in ('����', '���', '�Ｚ', 'BMW', 'AUDI') and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
order by 		cmo.car_year desc, cmo.price desc;

--4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
--  ������,����,������ �Ʒ��� ���� ������ �������� ���.
--  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
--   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
--   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
select				'['||model||'] ������ ������ ['||car_year||']�̰�, �������� ['||country||']�̸�, ['||maker||']�簡 �������Դϴ�. ������ ['||to_char(rpad(price, 7, '0'), '9,999,999')||']�� �Դϴ�.' as result
from				(
					select				rownum as low_price_rank, model, country, maker, price, car_year
					from				(
										select				cma.model, cc.country, cc.maker, cmo.price, cmo.car_year
										from				car_country cc, car_maker cma, car_model cmo
										where				(cc.maker = cma.maker(+) and cma.model = cmo.model(+)) and cma.model in ('K5','�ƹ���','�ҷ���','A8','SM3')
										order by			cmo.price asc
                    					)
          			)
where				low_price_rank between 2 and 7;

--5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ.
select			cmo.car_year, cmo.model, sum(cmo.price)
from			car_maker cma, car_model cmo
where			(cma.model = cmo.model) and cma.maker = '����'
group by		rollup(cmo.car_year, cmo.model);

select model from car_model;
--6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
--   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
--   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ
--   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
--   �����λ���� �μ���ȣ�� ���� ���� �λ�
--   10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
--   ����Ͽ� 3�ڸ����� ,�� �־� ���.
--   ��� ����� �ҹ��ڷ� ���.
select		e.empno, lower(e.ename), e.hiredate, e.sal, e.sal * 0.033 as tax,
			e.sal + e.sal/12 + nvl(comm, 0) - e.sal * 0.033 as real_money,
			decode(e.deptno, 10, e.sal * 0.07, 20, e.sal * 0.04, 30, e.sal+nvl(comm, 0) * 0.1, e.sal * 0.03) as inc,
			e.deptno, lower(d.dname), lower(d.loc), z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from		emp e, dept d, zipcode z
where		(e.deptno(+) = d.deptno) and 
























-- 3. ������ �����簡 '����', '���', '�Ｚ', 'BMW'�̰� �ɼǿ� 'ABS', 'TCS'�� �ִ� ������
--    ������, ������, �𵨸�, ����, ����, �ɼ�, �̹���, ��ⷮ ��ȸ
--    ��, ������ �������� ������������ �����ϰ�, ������ ���ٸ� ������ �������� ������������ �����Ͽ� ����Ѵ�.
--    �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ���,
--    ��������� ������ Bmw, Audi�� �������� ���.
