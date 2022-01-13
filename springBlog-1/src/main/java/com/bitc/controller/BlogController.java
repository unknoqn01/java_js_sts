package com.bitc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.dto.BlogDto;
import com.bitc.service.BlogService;

@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "/index";
	}
	
	// 메인 페이지
	@RequestMapping("/board/boardList")
	public Object boardList() throws Exception {
		
		ModelAndView mv = new ModelAndView("/board/boardList");
		List<BlogDto> datas =blogService.selectBoardList();
		mv.addObject("datas", datas);
		
		return mv;
	}
	
	// 상세 페이지
	@RequestMapping("/board/boardDetail")
	public Object boardDetail(@RequestParam("idx") int idx) throws Exception { 
		
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		BlogDto datas =blogService.selectBoardDtail(idx);
		mv.addObject("datas", datas);
		
		return mv;
	}
	
	// 글쓰기 페이지
	@RequestMapping("/board/boardWrite")
	public String boardWrite() throws Exception {
		return "/board/boardWrite";
	}
	
	// 글쓰기 페이지 등록
	@RequestMapping("/board/insertBoard")
	public String boardInsert(BlogDto dto) throws Exception {
		blogService.insertBoard(dto);
		
		return "redirect:/board/boardList";
	}


	//삭제 페이지
	@RequestMapping("/board/boardDelete") 
	public String boardDelete(@RequestParam("idx") int idx) throws Exception {
	
		blogService.deleteBoard(idx);
		
		return "redirect:/board/boardList";
	}

	//수정
	@RequestMapping("/board/boardUpdate")
	public String boardUpdate(BlogDto dto) throws Exception {
		
		blogService.updateBoard(dto);
		
		return "redirect:/board/boardList";
	}
	
	
	
	
}
