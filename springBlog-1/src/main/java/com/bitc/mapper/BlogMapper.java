package com.bitc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.dto.BlogDto;

@Mapper
public interface BlogMapper {

	List<BlogDto> selectBoardList() throws Exception;

	BlogDto selectBoardDtail(@Param("idx") int idx) throws Exception;

	void deleteBoard(@Param("idx") int idx) throws Exception;

	void updateBoard(BlogDto dto) throws Exception;

	void insertBoard(BlogDto dto) throws Exception;

	int selectMemberInfoYn(@Param("userId") String userId, @Param("userPw") String userPw) throws Exception;

}
