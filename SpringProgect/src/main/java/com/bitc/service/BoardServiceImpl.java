package com.bitc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.dto.BoardDto;
import com.bitc.dto.MemberDto;
import com.bitc.dto.MsgDto;
import com.bitc.mapper.BoardMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public Page<BoardDto> selectBoardList(int pageNum) throws Exception {
		PageHelper.startPage(pageNum, 5);
		return (Page<BoardDto>) boardMapper.selectBoardList();
	}

	@Override
	public Page<BoardDto> searchBoardList(int pageNum, String userId) throws Exception{
		PageHelper.startPage(pageNum, 5);
		return (Page<BoardDto>)boardMapper.searchBoardList(userId);
	}

	@Override
	public Page<BoardDto> searchBoardListContents(int pageNum, String contents) throws Exception {
		PageHelper.startPage(pageNum, 10);
		return (Page<BoardDto>)boardMapper.searchBoardListContents(contents);
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

	@Override
	public int selectMemberInfo(String userId, String userPw) throws Exception {
		return boardMapper.selectMemberInfo(userId, userPw);
	}

	@Override
	public MemberDto selectMemberInfoMy(String userId) throws Exception {
		return boardMapper.selectMemberInfoMy(userId);
	}

	@Override
	public void updateMy(MemberDto memberDto) throws Exception {
		boardMapper.updateMy(memberDto);
	}

	@Override
	public void deleteMember(int seq) throws Exception {
		boardMapper.deleteMember(seq);
	}

	@Override
	public void insertBoard(BoardDto boardDto) throws Exception {
		boardMapper.insertBoard(boardDto);
	}

	@Override
	public void signUp(MemberDto memberDto) throws Exception {
		boardMapper.signUp(memberDto);
	}

	@Override
	public List<MsgDto> selectMsg(String userId) throws Exception {
		return boardMapper.selectMsg(userId);
	}

	@Override
	public void sendMsg(MsgDto msg) throws Exception {
		boardMapper.sendMsg(msg);
	}

	@Override
	public void createMsgStrogae(String userId) throws Exception {
		boardMapper.createMsgStrogae(userId);
	}

	@Override
	public int findpw(MemberDto memberDto) throws Exception {
		return boardMapper.findpw(memberDto);
	}

	@Override
	public void updateTempPw(String userId, String userPw) throws Exception {
		boardMapper.updateTempPw(userId, userPw);
	}

	@Override
	public void deleteBoardUser(String userId) throws Exception {
		boardMapper.deleteBoardUser(userId);
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return 	boardMapper.idCheck(userId);

	}

	

}
