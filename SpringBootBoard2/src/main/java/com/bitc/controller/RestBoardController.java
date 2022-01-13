package com.bitc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.dto.RestBoardDto;
import com.bitc.service.RestBoardService;

@Controller
public class RestBoardController {

	@Autowired
	private RestBoardService restBoardService;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
//	REST란?
//	Representational State Transfer의 약자
//	자원을 이름으로 구분하여 해당 자원의 상태(정보)를 주고 받는 모든 것을 의미
//	REST는 웹의 기존 기술과 HTTP 프로토콜을 그대로 활용하여 웹의 장점을 최대한 활용할 수 있는 아키텍처
//	Http uri를 통해 자원을 명시하고, http의 method(get, post, put, delete)를 통해 해당 자원에 대한 CRUD를 적용하는 것을 의미
//	Create : 생성 - POST
//	Read : 조회 - GET
//	Update : 수정 - PUT
//	Delete : 삭제 - DELETE
	
//	기존방식 : /board/selectBoardDetail.do?idx=1
//	REST : /board/get/1
	
	@RequestMapping(value="/restBoard", method=RequestMethod.GET)
	public ModelAndView openBoardList() throws Exception {
		ModelAndView mv = new ModelAndView("/restBoard/restBoardList");
		
		List<RestBoardDto> boardList = restBoardService.selectBoardList();
		mv.addObject("boardList", boardList);
		
		return mv;
	}
	
//	RequestMethod 를 사용하여 클라이언트에서 요청한 데이터 전송 타입이 GET/POST에 따라서 다른 메서드를 실행함
//	RequestMethod 가 다르기 때문에 동일한 URL 을 사용할 수 있음
	@RequestMapping(value="/restBoard/write", method=RequestMethod.GET)
	public String writeBoard() throws Exception {
		return "/restBoard/restWriteBoard";
	}
	
	@RequestMapping(value="/restBoard/write", method=RequestMethod.POST)
	public String insertBoard(RestBoardDto restBoard) throws Exception {
		restBoardService.insertBoard(restBoard);
		
		return "redirect:/restBoard";
	}
	
//	@PathVariable 어노테이션은 메서드의 매개변수가 URI의 변수로 사용되는 것을 의미
	@RequestMapping(value="/restBoard/{idx}", method=RequestMethod.GET)
	public ModelAndView openBoardDetail(@PathVariable("idx") int idx) throws Exception {
		ModelAndView mv = new ModelAndView("/restBoard/restBoardDetail");
		
		RestBoardDto restBoard = restBoardService.selectBoardDetail(idx);
		mv.addObject("restBoard", restBoard);
		
		return mv;
	}
	
//	@RequestMapping(value="/restBoard/{idx}", method=RequestMethod.DELETE)
	@RequestMapping(value="/restBoard/delete/{idx}", method=RequestMethod.DELETE)
	public String deleteBoard(@PathVariable("idx") int idx) throws Exception {
		restBoardService.deleteBoard(idx);
		return "redirect:/restBoard";
	}
}















