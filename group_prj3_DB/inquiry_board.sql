drop table admin cascade constraint;
drop table member cascade constraint;
drop table inquiry_board cascade constraint;

CREATE TABLE ADMIN (
	ADMIN_ID VARCHAR2(10) NOT NULL, /* �����ھ��̵� */
	PASSWORD VARCHAR2(500), /* ��й�ȣ */
	AUTHORITY VARCHAR2(7), /* ���� */
	INPUTDATE VARCHAR2(10) DEFAULT sysdate, /* �߰��� */
	NAME VARCHAR2(30), /* �����ڸ� */
	ISREMOVED CHAR(1) NOT NULL, /* �������� */
	constraint pk_admin_id primary key(admin_id)
);

create table member(
	user_id varchar2(20) not null,
	password varchar2(20) not null,
	name varchar2(30) not null,
	birth varchar2(10) not null,
	phone varchar2(13) not null,
	inputdate varchar2(10) default sysdate not null,
	isbanned char(1) default 'N' not null, /* ���� ���� */
	isdropped char(1) default 'N' not null, /* Ż�� ���� */
	constraint pk_user_id primary key(user_id)
);

create table inquiry_board(
	num number not null,
	user_id varchar(20) not null,
	subject varchar2(1000) not null,
	user_contents clob not null,
	status char(1) default 'W' not null,
	w_date date default sysdate not null,
	views number(4),
	admin_id varchar2(10),
	r_contents varchar2(4000),
	r_date date default sysdate,
	constraint pk_inquiry_num primary key(num),
	constraint fk_user_id_to_inquiry foreign key(user_id) references member(user_id),
	constraint fk_admin_id_to_inquiry foreign key(admin_id) references admin(admin_id)
);

select * from member;
select * from admin;
select * from inquiry_board;

