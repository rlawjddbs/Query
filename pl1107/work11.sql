--���� 
--1. �Ի�⵵�� �Է¹޾� �ټӳ���� 10�� �̻��̸� '���ټ�'
--  �׷��� ������ '�ܱ�ټ�'�̶�� �޼����� ��ȯ�ϴ� �Լ� �ۼ�.
--
--2.  �ֹι�ȣ�� �Է¹޾� ������ ��ȯ�ϴ� �Լ� �ۼ�
--
--3. �ֹι�ȣ�� �Է¹޾� ��������� ��ȯ�ϴ� �Լ� �ۼ�
--  ���������  880101-1xx1111 ���� xx ���ڸ� �̰� 
--  �Ʒ��� ǥ�� ����. 
--  ����� : 00~08
-- 	�λ�� : 09~12
--	��õ�� : 13~15
--	��⵵ : 16~25
--	������ : 26~34
--  ��û�� : 35~47
--	���� : 48~66
--	��� : 67~92
--	���ֵ� : 93~95

set serveroutput on
set verify off

accept u_hiredate prompt '�Ի�⵵: '
accept u_ssn prompt '�ֹι�ȣ : '
declare
--	hiredate = '&u_hiredate';	
begin
	dbms_output.put_line(years_of_service('&u_hiredate'));
	dbms_output.put_line(check_gen('&u_ssn'));
	dbms_output.put_line(check_loc('&u_ssn'));	
end;
/