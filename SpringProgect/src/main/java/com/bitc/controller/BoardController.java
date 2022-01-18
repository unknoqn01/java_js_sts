package com.bitc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.dto.BoardDto;
import com.bitc.service.BoardService;
import com.github.pagehelper.PageInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService; 
	
	@RequestMapping("/")
	public String index() throws Exception {
		
		return "index";
	}
	
	// 게시판 메인 페이지
	@RequestMapping("/board/boardList")
	public ModelAndView boardList(@RequestParam(required = false, defaultValue= "1") int pageNum) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		PageInfo<BoardDto> datas = new PageInfo<>(boardService.selectBoardList(pageNum), 5);
		mv.addObject("data", datas);
		
		return mv;
	}
	
	//게시판 검색
	@RequestMapping("/board/boardSearch")
	public ModelAndView boardSearch(
			@RequestParam(required = false, defaultValue= "1") int pageNum, 
			@RequestParam("search") String userId) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		PageInfo<BoardDto> datas = new PageInfo<>(boardService.searchBoardList(pageNum, userId), 5);
		mv.addObject("data", datas);
		
		return mv;
	}
	
	// 게시판 상세 보기
	@RequestMapping("/board/boardDetail")
	public ModelAndView boardDetail(@RequestParam("idx") int idx) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		BoardDto datas = boardService.boardDetail(idx);
		mv.addObject("data", datas);
		
		return mv;
	}
	
	// 게시판 글쓰기
	@RequestMapping("/board/boardWrite")
	public String boardWrite() throws Exception {
		
		return "/board/boardWrite";
	}

}
