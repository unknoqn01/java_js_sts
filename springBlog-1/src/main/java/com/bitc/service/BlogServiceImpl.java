package com.bitc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.dto.BlogDto;
import com.bitc.mapper.BlogMapper;

@Service
public class BlogServiceImpl implements BlogService{

	@Autowired
	private BlogMapper blogmapper;
	
	@Override
	public List<BlogDto> selectBoardList() throws Exception {
		return blogmapper.selectBoardList();
	}

	@Override
	public BlogDto selectBoardDtail(int idx) throws Exception {
		return blogmapper.selectBoardDtail(idx);
	}

	@Override
	public void deleteBoard(int idx) throws Exception {
		blogmapper.deleteBoard(idx); 
	}

	@Override
	public void updateBoard(BlogDto dto) throws Exception {
		blogmapper.updateBoard(dto); 
	}

	@Override
	public void insertBoard(BlogDto dto) throws Exception {
		blogmapper.insertBoard(dto); 
	}
	
	@Override
	public int selectMemberInfoYn(String userId, String userPw) throws Exception {
		return blogmapper.selectMemberInfoYn(userId, userPw);
	}


}
