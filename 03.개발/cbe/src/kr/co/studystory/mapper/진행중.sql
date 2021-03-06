SELECT S_NUM, STUDY_NAME, LOC, CATEGORY, IMG, RECRUITMENT,TO_CHAR(INPUT_DATE, 'yyyy/mm/dd') INPUT_DATE, NICK, USER_IMG
FROM   ( SELECT S.S_NUM, S.STUDY_NAME, S.LOC, S.CATEGORY, S.IMG, S.RECRUITMENT, S.INPUT_DATE, U.NICK, U.IMG USER_IMG, ROW_NUMBER() OVER( ORDER BY S.INPUT_DATE DESC) R_NUM
				FROM STUDY S, USER_TABLE U
				WHERE S.ID=U.ID AND ACCEPT_FLAG='Y' AND S.DEACTIVATION='N' AND DELETE_FLAG='N' )
ORDER BY R_NUM ASC;


select * from fav_study;

SELECT COUNT(s_num) CNT
FROM fav_study
where id = 'Dkfkfl' and s_num = 's_000067';


SELECT COUNT(S_NUM) CNT
FROM FAV_STUDY
WHERE ID = 'Dkfkfl' AND S_NUM = 's_000082';
