package com.bitc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.dto.BoardDto;
import com.bitc.dto.MemberDto;
import com.bitc.dto.MsgDto;
import com.github.pagehelper.Page;

@Mapper
public interface BoardMapper {

	List<BoardDto> selectBoardList() throws Exception;

	List<BoardDto> searchBoardList(@Param("userId") String userId) throws Exception;

	Page<BoardDto> searchBoardListContents(String contents) throws Exception;
	
	BoardDto boardDetail(@Param("idx") int idx) throws Exception;

	void updateBoard(BoardDto boardDto) throws Exception;

	void deleteBoard(int idx) throws Exception;

	int selectMemberInfo(@Param("userId") String userId, @Param("userPw") String userPw) throws Exception;

	MemberDto selectMemberInfoMy(@Param("userId") String userId) throws Exception;

	void updateMy(MemberDto memberDto) throws Exception;

	void deleteMember(int seq) throws Exception;

	void insertBoard(BoardDto boardDto) throws Exception;

	void signUp(MemberDto memberDto) throws Exception;

	List<MsgDto> selectMsg(@Param("userId") String userId) throws Exception;

	void sendMsg(MsgDto msg) throws Exception;

	void createMsgStrogae(@Param("userId") String userId) throws Exception;

	int findpw(MemberDto memberDto) throws Exception;

	void updateTempPw(@Param("userId") String userId, @Param("userPw") String userPw) throws Exception;

	void deleteBoardUser(@Param("userId") String userId) throws Exception;

	int idCheck(@Param("userId") String userId) throws Exception;



}
