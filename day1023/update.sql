-- ���ǿ� �´� ���ڵ带 ã�� �÷��� ���� �����ϴ� ��
-- class4_info ���̺��� �л��� ��ȣ�� "2"�� �л��� ã�Ƽ� �̸��� '����ö'�� ����

/*
update	class4_info
set	name='����ö'
where	num=2;
*/

-- �л��� ��ȣ�� 10���� �л��� ã�Ƽ� �̸� - �ڿ���, ���� - 25, �̸��� - lee@daum.net, �Է��� - ���糯¥�� ����

update	class4_info
set	name='�ڿ���', age=25, email='lee@daum.net',
	input_date = sysdate
where	num=10;

commit;

-- �л��� ��ȣ�� 10���̸鼭 �̸��� '�ڿ���'�� �л��� �ֹι�ȣ�� '880101-1234567'�� ����

update	class4_info
set	ssn='880101-1234511'
where	num=11 and name='�ڿ���';
-- where	(num=11 and name='�ڿ���') or ���ذ�3	�� ���·� �������� �� �߰��� ���� ����.

commit;