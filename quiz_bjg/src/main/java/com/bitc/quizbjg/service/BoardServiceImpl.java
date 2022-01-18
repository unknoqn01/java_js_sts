package com.bitc.quizbjg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.quizbjg.dto.BoardDto;
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

	@Override
	public List<BoardDto> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

	@Override
	public BoardDto boardDetail(int idx) throws Exception {
		return boardMapper.boardDetail(idx);
	}

	@Override
	public void updateBoard(BoardDto boardDto) throws Exception {
		boardMapper.updateBoard(boardDto);
	}

	@Override
	public void deleteBoard(int idx) throws Exception {
		boardMapper.deleteBoard(idx);
	}

}
