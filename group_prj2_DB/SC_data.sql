--------------------------Data for table admin--------------------------------
insert into admin (admin_id, name, password, hiredate) values ('sso','�ڼҿ�',1234,'2018-05-24');
insert into admin (admin_id, name, password, hiredate) values ('hee','����ö',1234,'2018-05-24');
insert into admin (admin_id, name, password, hiredate) values ('jin','������',1234,'2008-06-01');
insert into admin (admin_id, name, password, hiredate) values ('young','�ڿ���',1234,'2013-07-31');

commit;
--------------------------Data for table member--------------------------------
insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('roma_emo','jmjmhaha','������','19820511','017-4567-3241','g', 45000, 55000, '2011-03-03');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('yesreal82','rice','�տ���','19820303','016-7541-3546','s', 70000, 270000, '2016-05-04');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('trust','luvkei','���ֿ�','19800711','010-7814-6572','g', 38000, 210000, '2016-07-27');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('doctor_seul','wouldyou123','������','20010721','010-7878-1354','s', 10000, 10000, '2011-12-31');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('seojin2','agalheadshot','������','19750412','010-4735-2141','s',10000, 10000, '2011-12-31');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('harvard17','!breakpyramid','������','19980612','010-7878-0101','v',20000, 310000, '2008-06-12');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('pyramid_top','chapagook17','������','19730731','010-7541-3456','g', 20000, 120000, '2019-01-20');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('jjini83','eomama!3546','������','19831212','010-4875-3546','v', 50000, 450000, '2009-10-12');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('mamasang','sorryhyena0','���ػ�','19730909','017-5784-3535','g', 45000, 150000, '2015-06-11');

insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
values('stealjam','bin22222','������','20070401','010-4577-4586','s', 10000, 10000, '2011-12-31');

commit;

--------------------------Data for table movie-------------------------------------
insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'��������','extreme_job.png','��ť���͸�','�ѱ�','�̺���','PG','111',
      '2019-01-23','��ö�־� �޸��� �������� �ٴ�, �ޱ�� ��ü ���⸦ �´� �����!
�� �̻� ������ ���� ���� ���� ���� ������� ���� ���������� ���� ���� �й��� ��Ȳ�� �����ϰ� ������, ������, ��ȣ, ���Ʊ��� 4���� ������� �Բ� �ẹ ���翡 ������.
������� 24�ð� ���ø� ���� ���������� ����Ʈ �� ġŲ���� �μ��� ���� â���� �ϰ� �ǰ�, ����� ����̰��� ���� �������� ���� ������� ġŲ���� �Ͼ� �������� �Լҹ��� ���� �����Ѵ�.
����� ����, ġŲ���� ���� �� �� ���� �ٺ��� ����ݿ��� ��� �� ��ȣ�� ��ȸ�� ã�ƿ��µ���',
      '���·�,���ϴ�','2019-01-21','sso');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'����','hit_and_run.png','����,�׼�','�ѱ�','������','PG','133',
      '2019-01-30','���� �� �ְ� ����Ʈ ���� ����� �Ҽ� ���� �����ÿ���(��ȿ��).
 �������� �����ϰ� �ϰ� ������ �������塯(������)�� �Բ�
 F1 ���̼� ����� ����� ������ö��(������)�� ��� ���� ������� �������� �ÿ���
 ������ ���� ���縦 �����ٴ� ������ ���� ���Ҵ� ��������� ��õ�ȴ�.

 �˰� ���� ������ ���� ���, ������ ���� ������塯(������)��
 ���� ���� õ���� ������ ���� ���̽� ���� �������硯(���ؿ�).
 ������ ���� �� �� ��, �Ŵ��� �ηµ� �ð��� ������ ���Ҵ� ��� �Ƿ¸�ŭ�� �ְ��� �����ݡ�.
 ����ؼ� ��ö�� �����ֽ��ϴ� �ÿ��� ������ ���� ���� ���ذ� ���Ҵ� ����� ������ �����ڰ� ��ö���� �˰� �ȴ�.

 ���Ҵ� ģ ���� ������ �Ѵ� ���� ���̽� �����
 �°� �񸮸� �ϻ�� ��ö�� ��� ���� ��� ���� �� �ÿ�.
 �ϳ��� ��ǥ�� ���� ���� ��ģ �׵��� ���÷��̰� ���۵Ǵ� ���
 ����� ������ �ʰ� ������� ���� �������� �����Ҵ� ���ǵ層 ��ö�� �ݰ� ���� ���� ���������µ���!',
      '��ȿ��,���ؿ�,������','2019-01-23','jin');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'�׸���','greenbook.png','���','�̱�','���� �з���','PG','130',
      '2019-01-09','���� ��𼭵� �ٸ� ��Ȱ! �Ϻ��� õ�� ������ ���� �ȸ���
��Ģ���� ��Ģ! ������ ������ ����ϡ�
���⵵, ���ݵ� �Ϻ��� �ٸ� �� ������ Ư���� ������ ���۵ȴ�!

1962�� �̱�, �Դ�� �ָԸ� �ϰ� ��ư��� ��� �߷��հ�(��� ���ٽ�)�� ����� ����� �� ��ü�� õ�� �ǾƴϽ�Ʈ �� �ȸ�(���㼣�� �˸�) �ڻ��� ������� ������ ���� �ȴ�.
��ǰ����� ��û�Ǵ� �� �̱� �������� �ܼ�Ʈ ��û�� ������ ���� ��ġ�� �ִ� �� �ȸ��� �����ϱ�� �ҹ��� �̱� ���� ���� ������ ������� ����ϰ�, ���� �Ⱓ ���� �ڽ��� ���𰡵� �� �������� ��ϸ� ����Ѵ�.
��ģ �λ��� ��ƿ� ��� �߷��հ��� ����� ��ǰ�� ��Ű�� ��ƿ� �� �ȸ� �ڻ�. ����, �ൿ, ����, ������� �޶� �ʹ� �ٸ� �� ����� �׵��� ���� ����ȳ��� ���׸��ϡ��� ������ Ư���� ���� ��� �����ϴµ���  ',
      '��� ���ٽ�, ���㼣�� �˸�','2019-01-02','hee');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'�巡�� ����̱�3','train_your_dragon3.png','�ִϸ��̼�','�̱�','�� ������̽�','PG','104',
      '2019-01-30','������ ���� �׵��� ������ ������ ���۵ȴ�!
������ ģ�� ���Ű� ���������� Ȱ������
 ����� �巡���� �����ϸ� ��ȭ�Ӱ� ��ư��� ��ũ��.
 ���ο� �巡�� ������Ʈ ǻ����� �Ѿư� ���������� ã�ٰ�
 ������ ������ ã�� ���ߴ� �巡���� �Ķ���̽� ��������塯�� �쿬�� �߰��ϰ� �ȴ�.
 ������ ��ȭ�� ���, ���� �־��� �巡�� ���� �׸����� ��������
 �巡����� ������ ��ũ���� ��ȭ���� �����ޱ� �����ϴµ���',
      '���� �ٷ�ÿ, �Ƹ޸�ī �䷹��','2019-01-20','young');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'������','the_secret_mission.png','���','�ѱ���','������','PG','135',
      '2019-01-09','1940��� �츮���� ���� ��������� �ִ� �漺.
 ���忡�� �ذ�� �� �Ƶ� �к� ������ ������ ��ġ�� ������ �Ǽ�.
 ���� ���� ���� �� ��������ȸ ��ǥ�� ���� ���� ��ȯ�̴�.
 ���� ����µ� �����ڿ��� ����̶��!
 �׷��� �Ǽ��� �ݱ�� ȸ���鿡 �з� ��ȯ�� �а� ���⸦ ���� �������� �׸� �޾Ƶ��δ�.
 ���� �ƴ� ���� ��ü �� ������ �;��� �Ǽ��� ����ó�� ���� ������ �츮���� �����Կ� ���߰�,
 ��ȯ ���� ������ ���� ������ �������̡��� ���� ���´� �Ǽ��� ���� ���츮���� �����Կ� �����.
 �� ���� ���� �ð�, ��¦ �������� ������ ���ø� ���� �������̡��� ������ �ϴµ���

 �츮���� ������ �ô�, ���� ������ �� ������ �Ǵ�.',
      '������,�����','2019-01-02','sso');

insert into movie
(movie_code, movie_title, movie_img, genre, country, director, movie_grade, runningtime,
playdate, synopsis, actor, movie_date, admin_id)
values (movie_code,'���Ͻ�ȣ��','every_day_a_good_day.png','���','�Ϻ�','���� Ÿ����','PG','100',
      '2019-01-17','ŰŰ Ű��, �׳డ �ǳ� �ϻ��� ������
������� �ϻ��� ���ϴ� �� �� ���� ������

�������� �븮�ڴ� ���� �ڽ��� �ϰ� ���� ���� ã�� ���ߴ�.
�쿬�� �����ϰ� �� �ٵ��� �׳��� �ϻ� �����鼭
����� ���ο��� ������ ������
������ ����� �Ұ� ������ ��Ȳ�⸦ ��ĥ ������
������ ������ �׳��� ���ϸ����� ä��� �����Ѵ�.',
      'ŰŰ Ű��, ���Ű �Ϸ�','2019-01-10','hee');

commit;

--------------------------Data for table theater-----------------------------------
insert into theater(screen_name, screen_price, seat_count)
values('N', 20000, 20);

insert into theater(screen_name, screen_price, seat_count)
values('P', 40000, 10);

commit;

--------------------------Data for table on_screen---------------------------------
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901290830', '2019-01-29', '0830', '1045', 'M_000020', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291045', '2019-01-29', '1045', '1300', 'M_000020', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291300', '2019-01-29', '1300', '1440', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291440', '2019-01-29', '1440', '1650', 'M_000018', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291650', '2019-01-29', '1650', '1911', 'M_000016', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901291911', '2019-01-29', '1911', '2132', 'M_000016', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901292132', '2019-01-29', '2132', '0117', 'M_000016', 'N');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901290830', '2019-01-29', '0830', '1045', 'M_000020', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291045', '2019-01-29', '1045', '1300', 'M_000020', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291300', '2019-01-29', '1300', '1440', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291440', '2019-01-29', '1440', '1650', 'M_000018', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291650', '2019-01-29', '1650', '1911', 'M_000016', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901291911', '2019-01-29', '1911', '2132', 'M_000016', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901292132', '2019-01-29', '2132', '0117', 'M_000016', 'P');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901300900', '2019-01-30', '0900', '1140', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301140', '2019-01-30', '1140', '1350', 'M_000021', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301350', '2019-01-30', '1350', '1604', 'M_000019', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301604', '2019-01-30', '1604', '1847', 'M_000017', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901301847', '2019-01-30', '1847', '2130', 'M_000017', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901302130', '2019-01-30', '2130', '2344', 'M_000019', 'N');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('N_1901302344', '2019-01-30', '2344', '0203', 'M_000016', 'N');

insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901300900', '2019-01-30', '0900', '1140', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301140', '2019-01-30', '1140', '1350', 'M_000021', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301350', '2019-01-30', '1350', '1604', 'M_000019', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301604', '2019-01-30', '1604', '1847', 'M_000017', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901301847', '2019-01-30', '1847', '2130', 'M_000017', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901302130', '2019-01-30', '2130', '2344', 'M_000019', 'P');
insert into on_screen(screen_num, screen_date, start_time, end_time, movie_code, screen_name)
values('P_1901302344', '2019-01-30', '2344', '0203', 'M_000016', 'P');

commit;


--------------------------Data for table book--------------------------------------
insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-22 11:20:45','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'harvard17','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-23 15:15:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'seojin2','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-22 08:29:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'jjini83','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000016',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-28 19:35:55','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),7,to_date('2019-01-24 20:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'mamasang','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-26 16:35:56','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-29 12:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'doctor_seul','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000021',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-30 11:03:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'','N_1901301140');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000020',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-24 09:07:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'stealjam','P_1901290830');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000020',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-29 08:17:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'','P_1901290830');

commit;

--------------------------Data for table standard_seat-----------------------------
insert into standard_seat(seat_num, book_number)
values(11,'NM_000016091');

insert into standard_seat(seat_num, book_number)
values(12,'NM_000016091');

insert into standard_seat(seat_num, book_number)
values(5,'NM_000021097');

insert into standard_seat(seat_num, book_number)
values(6,'NM_000021097');

commit;

--------------------------Data for table primium_seat------------------------------
insert into primium_seat(seat_num, book_number)
values(10,'NM_000020099');

insert into primium_seat(seat_num, book_number)
values(11,'NM_000020099');

insert into primium_seat(seat_num, book_number)
values(19,'NM_000020102');

insert into primium_seat(seat_num, book_number)
values(20,'NM_000020102');

commit;

--------------------------Data for table rating------------------------------------
insert into rating(book_number, movie_rate, review, member_id)
values('NM_000020099',8,'�������� �������̸� ū���� �̷�� �츮�̾߱� ������ ��Į�θ� �ϴ°� �ƴ϶� �츮���� �츮�� ���� �۷� �Ҽ��ִٴ°� �ϱ����ش�. �ʹ� ������!!','stealjam');

insert into rating(book_number, movie_rate, review, member_id)
values('NM_000016091',7,'������ ���� ���� ��ȭ�ΰŰ��ƿ�~~ �����鼭 ���� ���Գ׿� ����','harvard17');

insert into rating(book_number, movie_rate, review, member_id)
values('NM_000021095',10,'���� ���ܰ� ���� �ٽ� �ȿ� ������ ���� �׸��� �λ��� ������ �������� �׾ƿø� ��ȭ... ŰŰ Ű������ ���� ������ ��ġ ������ �ۺ��λ��� �� �ؼ� �ʹ� �����׿�Ф�','mamasang');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000016092', '7',
'���������� �̹� ��ǰ�� �� ������ ����ġ�� ���ӵ�� �ణ ��ġ�� ���� ���� �ʾ� �ִ�. ������ ���� Ȱ������ �׼� �ÿ����� �ÿ����� �谡 �ȴ�. ������ ���⿡ ���� ��ȭ�̴�.','seojin2');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000016093', 8, '���� Ÿ�� ���� ������ ��Ʈ���� �������� �� �ִ� ��ȭ�Դϴ�!! ���� �ڹ̵� ��ȭ�ϱ�� ���� ���� ����Ͻô� �е�, �׳� �ϰ� ���ŵ� ��ȸ �����ǰŶ�� �����մϴ�~! �g��!','jjini83');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000021096', 9, '���� �԰��Ͽ� ������ ���ֶ��� ������ ���� ������ ���İ� ����� �ʿ��Ѵ�.
���ĵ� ��� ������ �ʰ� ��ݵ� ��� ����� �ʴ�. �ð��� �帣�� �׻�ȭ�Ͽ� �ٸ���.
������ ���Ŀ� �������� �ʰ� ��ݿ� �������� ������ ���ݿ� ����ϰ� �ȴ�.
��ȭ������ �̷��� �ٵ��� ������� ���Ͻ�ȣ���� �������μ� ���Ѵ�. ħ���ϰ� �ൿ�ϸ� ������. �ٵ��� ���� �����̴�.','pyramid_top');

commit;

--------------------------Data for table snack--------------------------------
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('ī�������',6000,'caramel_popcorn.png','������ ī��� ���� ������ ī��������� ��ܺ�����!', '2016-08-14');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('�ݶ�',2000,'cola.png','���� ��𼭳� �� ��, �� ����!', '2017-04-25');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('�������',5000,'normal_popcorn.png','������ ������ ���� ��� �� �ִ� ¬¥���� Ŭ���� �������!', '2018-05-12');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('����',4500,'nacho.png','�ٻ�ٻ��� ���ݿ� ĥ��ġ�� ����, ���Ⱑ �ٷ� �߽���!?', '2018-01-08');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('�ƹݼ���¡��',7000,'grilled_squid.png','�ð� ��� ������ ����~!', '2019-01-24');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('��',2000,'water.png','�ƹ��͵� ���� ���, ���̶� ��ÿɼҼ�', '2018-06-04');
insert into snack(snack_name, snack_price, snack_img, snack_info, snack_date)
values('�Ƹ޸�ī��',3500,'americano.png','�������� Ŀ�� �� ��', '2019-01-02');

commit;

--------------------------Data for table snack_sale--------------------------------
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01231901', 2, 'Y', to_date('2019-01-23 15:15:15','yyyy-mm-dd hh24:mi:ss'), '�ݶ�','seojin2');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01281902', 4, 'Y', to_date('2019-01-29 12:20:35','yyyy-mm-dd hh24:mi:ss'), 'ī�������','doctor_seul');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01031903', 1, 'N', to_date('2019-01-29 16:37:15','yyyy-mm-dd hh24:mi:ss'), '�ƹݼ���¡��','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01141904', 2, 'N', to_date('2019-01-30 11:19:49','yyyy-mm-dd hh24:mi:ss'), '����','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01111905', 1, 'N', to_date('2019-01-30 11:31:24','yyyy-mm-dd hh24:mi:ss'), 'ī�������','');
insert into snack_sale(snack_order_num, quan, exchange, snack_sale_date, snack_name, member_id)
values('SOR_01191906', 3, 'Y', to_date('2019-01-24 20:20:35','yyyy-mm-dd hh24:mi:ss'), '����','mamasang');
select * from snack_sale;

commit;

