-- 시간 까지 정력했을 경우.
select * from study;
select * from STUDY ORDER BY INPUT_DATEselect * from FAV_STUDY;

-- 메인 페이지의 썸네일 리스트. - 최신순으로
select s.s_num, s.study_name, s.loc, s.category, s.img, s.recruitment, s.input_date, u.nick, u.img user_img, row_number() over( order by s.input_date desc) r_num
from study s, user_table u
where s.id=u.id and accept_flag='Y' and s.deactivation='N' and delete_flag='N';

-- 검색 페이지의 썸네일 리스트 - 최신순으로
select s_num, study_name, loc, category, img, recruitment, TO_CHAR(input_date, 'yyyy/mm/dd') input_date, nick, user_img
from   (select s.s_num, s.study_name, s.loc, s.category, s.img, s.recruitment, s.input_date, u.nick, u.img user_img, row_number() over( order by s.input_date desc) r_num
         from study s, user_table u
         where s.id=u.id and accept_flag='Y' and s.deactivation='N' and delete_flag='N')
where r_num between 1 and 9;

-- 검색 페이지의 썸네일 리스트 - 인기순으로.
select s_num, study_name, loc, category, img, recruitment, TO_CHAR(input_date, 'yyyy/mm/dd') input_date, nick, user_img
from   (select s.s_num, s.study_name, s.loc, s.category, s.img, s.recruitment, s.input_date, u.nick, u.img user_img, row_number() over( order by s.input_date desc) r_num
         from study s, user_table u
         where s.id=u.id and accept_flag='Y' and s.deactivation='N' and delete_flag='N')
where r_num between 1 and 9;

