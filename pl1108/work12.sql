--����
--1. �Ʒ��� Dictionary���̺��� ����Ͽ�
--user_constraints, user_tab_cols=>user_cons_columns, user_tab_columns
--�Էµ����̺� ���� ������׸�, �÷���, ��������
--�� ��ȸ�ϴ� �������� �ۼ� .
--
--2. ���� �۾��� �����ϴ� Procedure�� ����.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------Ȯ���� ���� ���� ----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from user_constraints;
select * from user_cons_columns;
select * from user_tab_columns;

select		uc.constraint_name, utc.column_name, utc.data_type
from	    user_constraints uc, user_tab_cols utc, user_tab_columns utcs
where		(uc.table_name = utc.table_name) and uc.table_name='DEPT' and uc.constraint_name is not null;

select uc.constraint_name, ucc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = ucc.table_name and ucc.table_name = utc.table_name)) and uc.table_name='DEPT';

select uc.table_name, ucc.table_name, utc.table_name, uc.constraint_name, ucc.constraint_name, ucc.column_name, utc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where (uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and uc.table_name='EMP';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------ ���� § ���� ----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select uc.table_name, ucc.table_name, utc.table_name, uc.constraint_name, ucc.constraint_name, ucc.column_name, utc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = utc.table_name)) and uc.table_name='EMP';

select uc.constraint_name, ucc.column_name, utc.data_type
from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and (uc.table_name = utc.table_name)) and uc.table_name='DEPT';




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------ �������� § ����   ---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select   utc.constraint_name,   utc. column_name,
	    	(select distinct data_type
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='DEPT';  
                                                                                                                                                                                                         



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------- �׿� �׽�Ʈ ���� -------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from emp;

select data_type
from user_tab_columns;

select * from user_tab_columns;

select distinct data_type
from user_tab_columns;

select   utc.constraint_name, utc. column_name,
	    	(select data_type
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='DEPT';
