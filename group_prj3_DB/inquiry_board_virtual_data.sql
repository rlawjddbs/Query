insert into admin(admin_id, password, authority, inputdate, isremoved) values('admin', '1234', 'ADMIN', sysdate, 'N');
insert into member(user_id, password, name, birth, phone, inputdate, isbanned, isdropped) values('user', 'qwer', '�հ���', '1989-09-06', '010-1234-1234', sysdate, 'N', 'N');

select * from admin;
select * from member;



/* admin ���̺� authority - admin, manager */

