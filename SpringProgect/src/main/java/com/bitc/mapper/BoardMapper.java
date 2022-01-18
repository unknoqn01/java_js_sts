package com.bitc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.dto.BoardDto;

@Mapper
public interface BoardMapper {

	List<BoardDto> selectBoardList() throws Exception;

	List<BoardDto> searchBoardList(@Param("userId") String userId) throws Exception;

	BoardDto boardDetail(@Param("idx") int idx) throws Exception;

}
