package com.bitc.quizbjg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
	@RequestMapping("/board/boardList")
	public String boardList() throws Exception {
		return "/board/boardList";
	}
	
}
