package com.bitc.quizbjg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.quizbjg.dto.BoardDto;
import com.bitc.quizbjg.dto.MemberDto;

@Mapper
public interface BoardMapper {

	public int selectMemberInfoYn(@Param("userId") String userId, @Param("userPw") String userPw);

	public void insertMember(MemberDto member) throws Exception;

	public List<BoardDto> selectBoardList() throws Exception;

	public BoardDto boardDetail(@Param("idx") int idx) throws Exception;

	public void updateBoard(BoardDto boardDto) throws Exception;

	public void deleteBoard(@Param("idx") int idx) throws Exception;

}
