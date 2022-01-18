package com.bitc.service;

import com.bitc.dto.BoardDto;
import com.github.pagehelper.Page;

public interface BoardService {

	Page<BoardDto> selectBoardList(int pageNum) throws Exception;

	Page<BoardDto> searchBoardList(int pageNum, String userId) throws Exception;

	BoardDto boardDetail(int idx) throws Exception;

}
