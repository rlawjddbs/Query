/* ���� �ڵ带 "SOR_01281901" �� ��ȯ�ϴ� �Լ� */
create or replace function snack_code
return char
is
     
begin
   return concat('SOR_', concat(to_char(sysdate,'mmddyy'), lpad(seq_snack.nextval, 2, MEMBER_ID)));
end;
/
