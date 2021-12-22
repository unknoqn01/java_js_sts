package com.bitc.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.board.dto.BoardDto;
import com.bitc.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService; 
	
	@RequestMapping("/board/openBoardList.do")
	public ModelAndView openBoardList() throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		
		List<BoardDto> boardList = boardService.selectBoardList();
		mv.addObject("boardList", boardList);
		
		return mv;
	}
}
