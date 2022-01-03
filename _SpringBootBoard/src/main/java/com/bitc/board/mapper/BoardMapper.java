package com.bitc.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.board.dto.BoardDto;

// mybatis와 연결되어 있다는 것을 의미하는 어노테이션
@Mapper
public interface BoardMapper {

//	데이터 베이스 연결하여 게시글 목록을 불러오는 메서드
	List<BoardDto> selectBoardList() throws Exception;
	
//	DB와 연결하여 게시글을 등록하는 메서드
	void insertBoard(BoardDto board) throws Exception;
	
//	DB와 연결하여 지정한 게시글의 모든 정보를 가져오는 메서드
	BoardDto selectBoardDetail(int idx) throws Exception;
	
//	DB와 연결하여 지정한 게시글을 DB에서 삭제하는 메서드
	void deleteBoard(int idx) throws Exception;
	
//	DB와 연결하여 지정한 게시글을 DB에서 수정하는 메서드
	void updateBoard(BoardDto board) throws Exception;
	
//	DB와 연결하여 지정한 게시글을 조회수를 수정하는 메서드
	void updateHitCnt(int idx) throws Exception;
}
