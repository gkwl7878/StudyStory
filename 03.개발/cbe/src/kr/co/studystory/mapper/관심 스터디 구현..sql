select s.s_num, category, cnt /* 추가로 필요한 컬럼만 명시 */
from study s, (select s_num, cnt
              				 from (select rownum r, s_num, cnt
                             			from (select s_num, count(*) cnt
                                  					from fav_study
                                  					where id = 'Dkfkfl'
                                					group by s_num
                                  					order by cnt desc))
                              		    where r between 1 and 9) sub
where s.s_num = sub.s_num;


select s.s_num, study_name, count(fs.s_num) cnt
from study s, fav_study fs, fav_study fs2
where s.s_num = fs.s_num and fs.s_num = fs2.s_num and fs2.id = 'Dkfkfl'
group by s.s_num, study_name;


--------

SELECT S_NUM, STUDY_NAME, LOC, CATEGORY, IMG, RECRUITMENT, TO_CHAR(INPUT_DATE, 'yyyy/mm/dd') INPUT_DATE, NICK, USER_IMG, cnt
FROM
(
SELECT S.S_NUM, S.STUDY_NAME, S.LOC, S.CATEGORY, S.IMG, S.RECRUITMENT, S.INPUT_DATE, U.NICK, U.IMG USER_IMG, COUNT(FS.S_NUM) cnt,
				ROW_NUMBER() OVER( ORDER BY COUNT(FS.S_NUM) DESC, INPUT_DATE DESC) R_NUM
FROM STUDY S, FAV_STUDY FS, fav_study fs2, USER_TABLE U
WHERE S.S_NUM = FS.S_NUM AND S.ID=U.ID AND fs.s_num = fs2.s_num and fs2.id = 'Dkfkfl' AND ACCEPT_FLAG='Y' AND S.DEACTIVATION='N' AND DELETE_FLAG='N'
GROUP BY S.S_NUM, S.STUDY_NAME, S.LOC, S.CATEGORY, S.IMG, S.RECRUITMENT, S.INPUT_DATE, U.NICK, U.IMG
)
ORDER BY R_NUM ASC
