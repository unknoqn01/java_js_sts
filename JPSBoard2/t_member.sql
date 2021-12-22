SELECT * FROM testdb.t_member;

select user_id, user_pw, user_name, user_email, user_phone, user_addr, user_gender
from t_member
where user_id = 'tester01'
and user_pw = 'bitc1234'
and deleted_yn = 'n';

-- 사용자 등록
insert into t_member (user_id, user_pw, user_name, user_email, user_phone, user_addr, user_gender)
values ('tester01', 'bitc1234', '테스터유저01', 'tester01@bitc.co.kr', '012345678', '부산광역시', 'M');

-- 사용자 수정
update t_member set user_pw = '1234'
where user_id = 'tester01'; 

-- 사용자 삭제
-- delete from t_member where user_id = 'tester01';
update t_member set deleted_yn = 'n'
where user_id = 'tester01';

-- 사용자 정보 존재 여부 확인
-- 사용자가 입력한 id/pw가 db에 존재하는지 여부 학인
select count(*) from t_member
where user_id = 'tester01'
and user_pw = 'bitc1234'
and deleted_yn = 'n';

-- 사용자 정보 조회
-- 사용자가 존재하고 사용자의 상세한 정보를 가져올 떄 사용
select user_id, user_pw, user_name, user_email, user_phone, user_addr, user_gender
FROM t_member
where deleted_yn = 'n';

