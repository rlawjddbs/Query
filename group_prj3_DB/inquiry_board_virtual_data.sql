-------------------------------------------- ADMIN TABLE Data --------------------------------------------------
/* admin ���̺� authority(����) �÷� �� - admin, manager */
insert into admin(admin_id, password, authority, inputdate, isremoved) values('admin', '1234', 'ADMIN', sysdate, 'N');
-------------------------------------------- MEMBER TABLE Data --------------------------------------------------
insert into member(user_id, password, name, birth, phone, inputdate, isbanned, isdropped) values('user', 'qwer', '�հ���', '1989-09-06', '010-1234-1234', sysdate, 'N', 'N');
-------------------------------------------- INQUIRY_BOARD TABLE Data --------------------------------------------
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�̰� ������?', '����� �Ŵ��� ������ ������?', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�ȳ��ϼ���?', '�����մϴ�.', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', 'asdf', 'asdf.', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�����ٶ�', '���ٻ�', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '���� �ֽ��ϴ�.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�����ٶ�', '���ٻ�', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�̰� ������?', '����� �Ŵ��� ������ ������?', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�ȳ��ϼ���?', '�����մϴ�.', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', 'asdf', 'asdf.', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�����ٶ�', '���ٻ�', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '���� �ֽ��ϴ�.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'W', sysdate, 1);
insert into inquiry_board(num, user_id, subject, user_contents, status, w_date, views) values(seq_inquiry_num.nextval, 'user', '�����ٶ�', '���ٻ�', 'W', sysdate, 1);

select * from admin;
select * from member;
select * from inquiry_board order by num desc;

select num, user_id, subject, user_contents, status, w_date, views, admin_id, r_contents, r_date, r_num
from 	(select num, user_id, subject, user_contents, status, w_date, views, admin_id, r_contents, r_date, row_number() OVER(ORDER BY w_date DESC) R_NUM
		FROM inquiry_board)
where r_num between 1 and 10;



commit;
