package com.bitc.service;

import java.util.List;

import com.bitc.dto.BoardDto;
import com.bitc.dto.MemberDto;
import com.bitc.dto.MsgDto;
import com.github.pagehelper.Page;

public interface BoardService {

	Page<BoardDto> selectBoardList(int pageNum) throws Exception;

	Page<BoardDto> searchBoardList(int pageNum, String userId) throws Exception;
	
	Page<BoardDto> searchBoardListContents(int pageNum, String contents) throws Exception;

	BoardDto boardDetail(int idx) throws Exception;

	void updateBoard(BoardDto boardDto) throws Exception;

	void deleteBoard(int idx) throws Exception;

	int selectMemberInfo(String userId, String userPw) throws Exception;

	MemberDto selectMemberInfoMy(String userId) throws Exception;

	void updateMy(MemberDto memberDto) throws Exception;

	void deleteMember(int seq) throws Exception;

	void insertBoard(BoardDto boardDto) throws Exception;

	void signUp(MemberDto memberDto) throws Exception;

	List<MsgDto> selectMsg(String userId) throws Exception;
	
	void sendMsg(MsgDto msg) throws Exception;

	void createMsgStrogae(String userId) throws Exception;

	int findpw(MemberDto memberDto) throws Exception;

	void updateTempPw(String userId, String userPw) throws Exception;

	void deleteBoardUser(String userId) throws Exception;

	int idCheck(String userId) throws Exception;



}
