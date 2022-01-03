package com.bitc.board.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitc.board.common.FileUtils;
import com.bitc.board.dto.BoardDto;
import com.bitc.board.mapper.BoardMapper;

// 내부에서 자바 로직을 처리하는 어노테이션
// 지정한 interface 대신 실행하는 의미
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileUtils fileUtils;
	
	//	부모인 BoardService 인터페이스가 가지고 있는 추상 메서드를 재정의
	@Override
	public List<BoardDto> selectBoardList() throws Exception {
//		mybatis와 연결되어 있는 BoardMapper를 이용하여 실제 데이터베이스에서 데이터를 조회
		return boardMapper.selectBoardList();
	}
	
//	부모인 BoardService 인터페이스가 가지고 있는 추상 메서드를 재정의
//	업로드된 파일을 분석하기 위한 매개변수 및 내용 처리
	@Override
	public void insertBoard(BoardDto board, MultipartHttpServletRequest multiFiles) throws Exception {
//		DB를 조작하는 Mapper의 insertBoard()메서드를 사용하여 실제 DB에 데이터를 추가함
// 		현재 DB에 저장하지 않기 위해서 잠시 주석처리
		boardMapper.insertBoard(board);

		List<BoardFileDto> list = fileUtils.parseFleInfo(board.getIdx(), multiFiles);
		
////		ObjectUtils : 스프링프레임워크에서 지원하는 유틸 클래스
////		isEmpty() : 지정한 객체가 비었는 지 아닌 지 확인 비었으면 true, 아니면 true 		
//		if (ObjectUtils.isEmpty(multiFiles) == false) {
////			업로드된 파일정보 객체가 가지고 있는 모든 파일 이름을 반환
//			Iterator<String> iterator = multiFiles.getFileNames();
//			String name; // 파일명을 저장할 변수
//			
////			데이터가 있는지 확인			
//			while(iterator.hasNext()) {
////				파일명 반환				
//				name = iterator.next();
//				System.out.println("file tag name : " + name);
//
////				파일에 대한 정보를 MultipartFile클래스로 생성한 list 타입으로 반환								
//				List<MultipartFile> list = multiFiles.getFiles(name);
//		
//				for (MultipartFile mFile : list) {
//					System.out.println("\n------------Start file info-------\n");
//					
//					// 파일명 가져오기
//					System.out.println("file name" + mFile.getOriginalFilename());
//					
//					// 파일 크기 가져오기
//					System.out.println("file size" + mFile.getSize());
//					
//					// 파일 타입 가져오기
//					System.out.println("file content type : " + mFile.getContentType());
//					
//					System.out.println("\n---------End file info -------\n");
//				}
//			}
		
		}
		
	}
	
	@Override
	public BoardDto selectBoardDetail(int idx) throws Exception {
		boardMapper.updateHitCnt(idx);
		BoardDto board = boardMapper.selectBoardDetail(idx);
		
		return board;
	}
	
	@Override
	public void deleteBoard(int idx) throws Exception {
		boardMapper.deleteBoard(idx);
	}
	
	@Override
	public void updateBoard(BoardDto board) throws Exception {
		boardMapper.updateBoard(board);
	}
}








