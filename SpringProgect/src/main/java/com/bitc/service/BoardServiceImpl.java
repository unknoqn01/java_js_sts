package com.bitc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.dto.BoardDto;
import com.bitc.mapper.BoardMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public Page<BoardDto> selectBoardList(int pageNum) throws Exception {
		PageHelper.startPage(pageNum, 10);
		return (Page<BoardDto>) boardMapper.selectBoardList();
	}

	@Override
	public Page<BoardDto> searchBoardList(int pageNum, String userId) throws Exception{
		PageHelper.startPage(pageNum, 10);
		return (Page<BoardDto>)boardMapper.searchBoardList(userId);
	}

	@Override
	public BoardDto boardDetail(int idx) throws Exception {
		return boardMapper.boardDetail(idx);
	}

	
}
