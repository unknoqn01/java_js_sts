SELECT * FROM testdb.t_board;

-- 글 상세 보기
select title, contents, creator_id, created_date, hit_cnt
from t_board
where idx = 2
and deleted_yn = 'n';

-- 등록
insert into t_board (title, contents, creator_id, created_date)
values ('제목', '컨텐츠', 'testuser', now());

-- 수정
update t_board set title = '테스트', contents = 'test', updated_date = now()
where idx = 2; 

-- 삭제
-- delete from t_member where user_id = 'tester01';
update t_board set deleted_yn = upper('n')
where idx = 2;
