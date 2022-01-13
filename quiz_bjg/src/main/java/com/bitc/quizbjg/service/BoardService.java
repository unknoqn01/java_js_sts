package com.bitc.quizbjg.service;

import com.bitc.quizbjg.dto.MemberDto;

public interface BoardService {

	int selectMemberInfoYn(String userId, String userPw) throws Exception;

	void insertMember(MemberDto member) throws Exception;

}
