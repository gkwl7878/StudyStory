select *
from FAV_STUDY
where id = 'Dkfkfl';
select * from STUDY;
select * from USER_TABLE  ;


insert into FAV_STUDY(s_num, id) values('s_000021', 'Dkfkfl');
insert into FAV_STUDY(s_num, id) values('s_000022', 'Dkfkfl');
commit;

SELECT S_NUM, STUDY_NAME, LOC, CATEGORY, IMG, RECRUITMENT, TO_CHAR(INPUT_DATE, 'yyyy/mm/dd') INPUT_DATE, NICK, USER_IMG
FROM   (SELECT S.S_NUM, S.STUDY_NAME, S.LOC, S.CATEGORY, S.IMG, S.RECRUITMENT, S.INPUT_DATE, U.NICK, U.IMG USER_IMG, ROW_NUMBER() OVER( ORDER BY S.INPUT_DATE DESC) R_NUM
        FROM FAV_STUDY fs, STUDY s, USER_TABLE u
        WHERE ( fs.S_NUM = s.S_NUM ) and ( s.ID=u.ID ) and fs.ID = 'gohome1');
