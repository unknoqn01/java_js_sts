package com.bitc.quizbjg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.quizbjg.dto.MemberDto;
import com.bitc.quizbjg.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public int selectMemberInfoYn(String userId, String userPw) throws Exception {
		return boardMapper.selectMemberInfoYn(userId, userPw);
	}

	@Override
	public void insertMember(MemberDto member) throws Exception {
		boardMapper.insertMember(member);
	}


}
