select * from diary;


create table diary_reply(
	num number,
	num_ref number,
	writer varchar2(30),
	content varchar2(600),
	input_date date,
	constraint pk_diary_reply primary key(num),
	constraint fk_num_ref foreign key(num_ref) references diary(num)
);

select * from diary
order by num desc;

---------------------- ���� ���� num ������ ���� ------------------------
create sequence seq_reply
increment by 1
start with 1
maxvalue 999999999;

commit;

insert into diary_reply(num, num_ref, writer, content, input_date)
values(seq_reply.nextval, 62, '������', '����� ������ �̸����� �� �뼭���� �ʰڴ�!!', sysdate);
insert into diary_reply(num, num_ref, writer, content, input_date)
values(seq_reply.nextval, 62, '����ö', '��! �뼭�� �궼��!!!', sysdate);
select * from diary_reply;
