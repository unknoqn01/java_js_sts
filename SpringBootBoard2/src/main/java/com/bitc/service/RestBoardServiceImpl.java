package com.bitc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.dto.RestBoardDto;
import com.bitc.mapper.RestBoardMapper;

@Service
public class RestBoardServiceImpl implements RestBoardService {

	@Autowired
	private RestBoardMapper restBoardMapper;
	
	@Override
	public List<RestBoardDto> selectBoardList() throws Exception {
		return restBoardMapper.selectBoardList();
	}

	@Override
	public void insertBoard(RestBoardDto restBoard) throws Exception {
		restBoardMapper.insertBoard(restBoard);
	}

	@Override
	public RestBoardDto selectBoardDetail(int idx) throws Exception {
		return restBoardMapper.selectBoardDetail(idx);
	}

	@Override
	public void deleteBoard(int idx) throws Exception {
		restBoardMapper.deleteBoard(idx);
	}

	@Override
	public void updateBoard(RestBoardDto restBoard) throws Exception {
		// TODO Auto-generated method stub
		
	}

}







