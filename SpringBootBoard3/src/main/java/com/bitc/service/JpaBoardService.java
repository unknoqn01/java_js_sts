package com.bitc.service;

import java.util.List;

import com.bitc.entity.BoardEntity;

public interface JpaBoardService {
	
	List<BoardEntity> selectBoardList() throws Exception;
}
