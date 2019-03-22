--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- inner join : ���δٸ� ���̺� ���� ���� �ִ� ��쿡�� ��ȸ.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- �����ȣ, �����, �μ���ȣ, �μ���, ��ġ, ���� ��ȸ
-- �����ȣ, �����, �μ���ȣ, ���� (emp table)
-- �μ���ȣ, �μ���, ��ġ(dept table)
-- ANSI
select 			empno, ename, emp.deptno, dname, loc, sal
from				emp
inner join      	dept
on					emp.deptno = dept.deptno;


select 			empno, ename, e.deptno, dname, loc, sal
from				emp e
inner join      	dept  d
on					e.deptno = d.deptno;

select 			empno, ename, e.deptno, dname, loc, sal
from				emp e
inner join      	dept  d
on					d.deptno = e.deptno;

select 			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from				emp e
inner join      	dept  d
on					d.deptno = e.deptno;

-- Oracle inner join
-- ���� ������ �߸� �����ϸ� 'īƼ�� ���δ�Ʈ'�� �߻��Ѵ�.
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d;
-- where ���� �̿��Ͽ� īƼ�� ���δ�Ʈ ����, ����
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d
where			e.deptno=d.deptno;
-- where ������ ��ȸ���� ���� �� and �� Ȱ���Ͽ� �˻����� ����, ����
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d
where			e.deptno=d.deptno and e.deptno=20;

--  ������ ���̺� PK ����
alter table car_country add constraint pk_car_country primary key(maker);
-- ������ ���̺� FK ����
alter table car_maker add constraint fk_maker foreign key(maker) references car_country(maker);
-- ������ ���̺� PK ����
alter table car_maker add constraint pk_maker primary key(model);
-- �� ���̺��� FK����
alter table car_model add constraint fk_model foreign key(model) references car_maker(model);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ���̺� 3�� ��ȸ
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- �𵨸��� '�ƹ���', '�ҳ�Ÿ', 'A8'�� ������ ������, ������, �𵨸�,
-- ����, ����, �̹��� ��ȸ
select * from car_country;
select * from car_maker;
select * from car_model;
-- ANSI
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from				car_country 	cc
inner join		car_maker	cma
on					cma.maker=cc.maker
inner join		car_model	cmo
on                 cmo.model = cma.model
where				cmo.model in('�ƹ���','�ҳ�Ÿ','A8');

-- Oracle
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from				car_country 	cc, car_maker cma, car_model cmo
where				(cma.maker=cc.maker and cmo.model=cma.model) and cmo.model in ('�ƹ���', '�ҳ�Ÿ', 'A8');

-- �����ȣ, �����, ����, �Ի���, �μ���ȣ, �μ���, ��ġ, �����ȣ, �õ�, ����, ��, ������ ��ȸ�ϼ���
-- ������̺��� �����ȣ�� �����ȣ ���̺��� seq�� ������������ ���
-- ���� �Ѱ�
-- ANSI
select 		e.empno, e.ename, e.sal, e.hiredate, e.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji, z.seq
from			emp e
inner join    dept d
on				e.deptno = d.deptno
inner join	zipcode z
on				e.deptno = z.seq;
-- Oracle
select 	e.empno, e.ename, e.sal, e.hiredate, e.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji, z.seq
from		emp e, dept d, zipcode z
where	    (e.deptno = d.deptno and e.deptno = z.seq);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- outer join : ��� ���� ���̺��� ���ڵ尡 �����ϴ��� ��ȸ
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ��� �μ��� �μ���ȣ, �μ���, �����ȣ, �����, �Ի��� ��ȸ
-- ANSI ) left�� right�� ����� �� ���ڵ尡 �ִ� �� ���̺� ����
-- ���ڵ��� ������ �� �𸥴ٸ� full outer join�� �Ͽ� ���� ���̺� ��� ��ȸ�ϸ� �ȴ�.
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left outer join			emp e
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e
right outer join			dept d
on							e.deptno=d.deptno;
-- outer�� ���� ����
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left join					emp e
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left outer join			emp e
on							e.deptno=d.deptno;
-- ANSI full outer join (ANSI �� ����)
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e
full outer join			dept d
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
full outer join			emp e
on							e.deptno=d.deptno;


-- Oracle ) ���� ���ǿ� ���ڵ尡 ���� �ʿ� (+)�� ���δ�.
select						d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						(e.deptno(+)=d.deptno);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d, emp e
where						d.deptno = e.deptno(+);

select						e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d, emp e
where						d.deptno = e.deptno(+);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						d.deptno = e.deptno(+);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						e.deptno(+) = d.deptno;

--
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp AS e, dept AS d
where						e.deptno(+) = d.deptno;

-- (+)�� ���ʿ� ���� �� ����.
select						d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						(e.deptno(+)=d.deptno(+));

-- �����簡 '����', '���'�� ��� ������ ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ�Ѵ�.
select					cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from					car_country cc, car_maker cma, car_model cmo
where					(cma.maker = cc.maker and cmo.model(+) = cma.model) and cma.maker in('����', '���');

select					cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from					car_country cc, car_maker cma, car_model cmo
where					(cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cma.maker in('����', '���');


-- �𵨸��� 'K5', 'K7', '�ҳ�Ÿ', '�ƹ���', 'Cclass', 'A6'�� ��� ������
-- ������, ������, �𵨸�, ����, ������ ��ȸ
-- ��, ������ ������������ �����Ͽ� ��ȸ�� ��, ������ ���ٸ� ������ ������������ ������ ��
-- ���� Ǭ ��
-- ANSI


-- Oracle
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price
from				car_country cc, car_maker cma, car_model cmo
where				(cma.model=cmo.model and cc.maker = cma.maker(+)) and cma.model in ('K5', 'K7', '�ҳ�Ÿ', '�ƹ���', 'Cclass', 'A6')
order by			cmo.price desc, cmo.car_year asc;

-- self join (���������� Ȱ��)
-- ������̺��� 'scott'�� ������� ������ ���Թ޴� ����� �����ȣ, �����, �Ի���, ���� ��ȸ
-- ���� Ǭ��
select			empno, ename, hiredate, sal
from			emp
where			sal < (select sal from emp where ename='SCOTT')
order by		sal asc;
-- Ǯ�� �Ѱ�
select			e1.empno, e1.ename, e1.hiredate, e1.sal
from			emp e1, emp e2
where			(e1.sal < e2.sal) and e2.ename='SCOTT'
order by		sal asc;

select			e1.empno, e1.ename, e1.hiredate, e1.sal
from			emp e1, emp e2
where			(e1.sal < e2.sal) and e2.ename='SCOTT'
order by		sal asc;

-- �ζ��� �信�� ������� �ٸ���� �ζ��� �� �ٱ������� ����� �� ����.
select ename
from (
		select e.ename, e.sal, d.dname
		from  emp e, dept d
);



select * from car_country;
select * from car_maker;
select * from car_model;
select * from zipcode;

select * from user_constraints;