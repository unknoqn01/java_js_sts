package com.bitc.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.board.dto.BoardDto;

@Mapper
public interface BoardMapper {

	List<BoardDto> selectBoardList() throws Exception;
}
