select *
from FAV_STUDY
where id = 'Dkfkfl';
select * from STUDY;
select * from USER_TABLE  ;


insert into FAV_STUDY(s_num, id) values('s_000021', 'Dkfkfl');
insert into FAV_STUDY(s_num, id) values('s_000022', 'Dkfkfl');
commit;

SELECT  FSTD.ID, STD.S_NUM, STD.STUDY_NAME, STD.LOC, STD.CATEGORY, STD.IMG, STD.RECRUITMENT, TO_CHAR(STD.INPUT_DATE, 'YYYY/MM/DD') INPUT_DATE, UT.NICK, UT.IMG USERIMG
		FROM STUDY STD, USER_TABLE UT, FAV_STUDY FSTD
		WHERE ( STD.S_NUM=FSTD.S_NUM ) and ( STD.ID=UT.ID ) and FSTD.ID = 'Dkfkfl';
