package com.bitc.service;

import java.util.List;

import com.bitc.dto.BlogDto;

public interface BlogService {

	List<BlogDto> selectBoardList() throws Exception;

	BlogDto selectBoardDtail(int idx) throws Exception;

	void deleteBoard(int idx) throws Exception;

	void updateBoard(BlogDto dto) throws Exception;

	void insertBoard(BlogDto dto) throws Exception;
	
	int selectMemberInfoYn(String userId, String userPw) throws Exception;

}
