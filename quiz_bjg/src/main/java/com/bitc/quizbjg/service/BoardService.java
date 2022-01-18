package com.bitc.quizbjg.service;

import java.util.List;

import com.bitc.quizbjg.dto.BoardDto;
import com.bitc.quizbjg.dto.MemberDto;

public interface BoardService {

	int selectMemberInfoYn(String userId, String userPw) throws Exception;

	void insertMember(MemberDto member) throws Exception;

	List<BoardDto> selectBoardList() throws Exception;

	BoardDto boardDetail(int idx) throws Exception;

	void updateBoard(BoardDto boardDto) throws Exception;

	void deleteBoard(int idx) throws Exception;

}
