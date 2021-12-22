package com.bitc.board.service;

import java.util.List;

import com.bitc.board.dto.BoardDto;

public interface BoardService {

		List<BoardDto> selectBoardList() throws Exception;
}
