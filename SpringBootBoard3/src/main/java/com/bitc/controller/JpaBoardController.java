package com.bitc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.entity.BoardEntity;
import com.bitc.service.JpaBoardService;

@Controller
public class JpaBoardController {

	@Autowired
	private JpaBoardService jpaBoardService;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
	@RequestMapping(value="/jpa/board", method=RequestMethod.GET)
	public ModelAndView openBoardList(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/board/jpaBoardList");
		
		List<BoardEntity> boardList = new jpaBoardService.selectBoardList();
		mv.addObject("boardList", boardList);
		
		return mv;
	}
	
}
