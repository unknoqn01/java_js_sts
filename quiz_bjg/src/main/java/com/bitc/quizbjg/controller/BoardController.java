package com.bitc.quizbjg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.quizbjg.dto.BoardDto;
import com.bitc.quizbjg.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
	// 게시판 메인 페이지
	@RequestMapping(value="/board/boardList", method=RequestMethod.GET)
	public ModelAndView boardList() throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		List<BoardDto> boardList = service.selectBoardList();
		
		mv.addObject("boardList", boardList);
		
		return mv;
	}
	
	// restAPI : 게시글 조회
	@ResponseBody
	@RequestMapping(value="/board/boardListAll", method=RequestMethod.GET)
	public Object boardListapi() throws Exception {
		
		return service.selectBoardList();
	}
	
	// 게시글 상세 조회
	@RequestMapping(value="/board/boardDetail", method=RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("idx") int idx) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		
		BoardDto boardDetailList = service.boardDetail(idx);
		mv.addObject("boardList", boardDetailList);
			
		return mv;
	}
	
	
	// 게시글 수정
	@RequestMapping(value = "/board/boardDetail/{idx}", method = RequestMethod.PUT)
	public String boardDetailEdit(@PathVariable("idx") int idx) throws Exception {
		BoardDto boardDto = new BoardDto();
		boardDto.setIdx(idx);
		service.updateBoard(boardDto);
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 삭제
	@RequestMapping(value ="/board/boardDetail/{idx}", method = RequestMethod.DELETE)
	public String boardDetaildel(@PathVariable("idx") int idx) throws Exception {
		service.deleteBoard(idx);
		return "redirect:/board/boardList";
	}
}
