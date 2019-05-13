select * from study;
select nick from user_table where id = 'kim111';
select id from user_table where nick = '곰발자';
select * from user_table;

update user_table set nick='곰발자111' where id='kim111';
commit;
insert into alarm(A_NUM, CATEGORY, SUBJECT, CONTENT, INPUT_DATE,  READ_FLAG, ID)
values(A_CODE, '스터디', '참여 신청이 있습니다.', '님이 스터디 참여 신청을 하셨습니다.', SYSDATE, 'N', ( select id from user_table where nick = '곰발자') );

select * from alarm;
