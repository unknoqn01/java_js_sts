package com.bitc.service;

import java.util.List;

import com.bitc.dto.RestBoardDto;

public interface RestBoardService {

	List<RestBoardDto> selectBoardList() throws Exception;

	void insertBoard(RestBoardDto restBoard) throws Exception;

	RestBoardDto selectBoardDetail(int idx) throws Exception;

	void deleteBoard(int idx) throws Exception;
	
	void updateBoard(RestBoardDto restBoard) throws Exception;
}
