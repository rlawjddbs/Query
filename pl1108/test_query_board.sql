-- emp ���̺��� �����ȣ ����� �Ի��� ���� ������ test_proc ���̺� ��� ���ο� ���̺��� ����ڴ�.
create table test_proc as
	(select empno, ename, hiredate, sal, job from emp where 1=0);

-- test_proc ���̺��� empno �÷��� pk_test_proc��� �̸���  primary key ��������� �߰��ϰڴ�.
alter table test_proc add constraint pk_test_proc primary key(empno);

-- Primary Key ���ุ ���ڴ�.
select * from user_constraints
where constraint_type='P';

-- procedure insert_test_proc ���ν����� ����
var msg varchar2(300);
var cnt number;

-- ���ν��� insert_test_proc ���� ����
exec insert_test_proc(1111, '�׽�Ʈ', 3000, '����', :msg, :cnt);

-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;

-- ������� 1 : �����ȣ 1 ~ 9999�� ���� �Է� �������� Ȯ��, 0�� �Է�, 10000�� �Է�
-- ���ν��� insert_test_proc ���� ����
exec insert_test_proc(0, '�׽�Ʈ', 3000, '����', :msg, :cnt);
exec insert_test_proc(10000, '�׽�Ʈ', 3000, '����', :msg, :cnt);

-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;


-- ������� 2 : ���� 2500~8000 ����, 2500���� 2500����
-- 8000 �̻��̶�� 8000����
-- ���ν��� insert_test_proc ���� ����
exec insert_test_proc(1112, '�׽�Ʈ', 2400, '���', :msg, :cnt);
exec insert_test_proc(1113, '�׽�Ʈ', 8500, '���', :msg, :cnt);


-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;
select * from test_proc;

-- ������� 3 : ���, ����, �븮, ����, ����, ����, �̻�, ����, ��
exec insert_test_proc(1114, '�׽�Ʈ', 1400, '�˹�', :msg, :cnt);

-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;
select * from test_proc;

-- ������� 4 : ������ ù �ڸ� �빮�ڷ�
exec insert_test_proc(1114, 'kim', 1400, '���', :msg, :cnt);

-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;
select * from test_proc;

-- ������� 5 : ������� ��� �ԷµǴ� ���
exec insert_test_proc(1115, '������', 5000, '����', :msg, :cnt);

-- ���ν��� ���� ��� Ȯ��
print msg;
print cnt;
select * from test_proc;

-- update_test_proc ���ν��� �׽�Ʈ1.
exec update_test_proc(1111, '�븮', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1110, '�븮', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1111, '�˹�', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1111, '����', 4000, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

-- update_test_proc ���ν��� �׽�Ʈ2.
select * from user_procedures;
-- �ܺκ��� ����
var msg varchar2(300);
var cnt number;

-- ���ν��� ����1.
execute update_test_proc(1112, '����', 3000, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- ���ν��� ����2. - �����̶�� �� ���
execute update_test_proc(1112, '����', 3100, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- ���ν��� ����3. - ������ ��Ƴ��� ���
execute update_test_proc(1114, '����', 2490, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- delete_test_proc ���ν��� �׽�Ʈ1. - �����ϴ� �����ȣ�� ����
execute delete_test_proc(1111, :msg, :cnt);
print cnt;
print msg;
select * from test_proc;

-- delete_test_proc ���ν��� �׽�Ʈ2. - �������� �ʴ� �����ȣ�� ����
execute delete_test_proc(1110, :msg, :cnt);
print cnt;
print msg;
select * from test_proc;

-- select_test_proc_cnt ���ν��� �׽�Ʈ1. -
var sal number;

exec select_test_proc_cnt('����', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

-- select_test_proc_cnt ���ν��� �׽�Ʈ2. -
var sal number;

exec select_test_proc_cnt('���', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

select * from test_proc;

-- select_test_proc_cnt ���ν��� �׽�Ʈ3. -
var sal number;

exec select_test_proc_cnt('��븮', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

select * from test_proc;

-- search_zipcode ���ν��� �׽�Ʈ 1. - �� �̸����� �����ȣ �˻�
execute search_zipcode('���ﵿ', :msg, :cnt);
print cnt;
print msg;
select dong from zipcode;

-- select_all_dept ���ν��� �׽�Ʈ 1. - ������� ���
-- 1. bind���� ���� : var ������ refcursor;
-- 2. ���� : 			exec ���ν�����( : ������ )
-- 3. ��� : 			print ������;

-- sys_refcursor�� ���
var cur_dept refcursor;

-- sys_refcursor �� ����
exec select_all_dept(:cur_dept);

-- ���
print cur_dept;



-- select_emp ���ν��� �׽�Ʈ 1 .
var asdfasdf refcursor;
execute select_emp(11, :asdfasdf);
                                          
-- ����
--�Ʒ��� Dictionary���̺��� ����Ͽ� 
--user_constraints, user_tab_cols, user_tab_columns
--�Էµ����̺� ���� ������׸�, �÷���, �������� 
--�� ��ȸ�ϴ� �������� �ۼ� 


