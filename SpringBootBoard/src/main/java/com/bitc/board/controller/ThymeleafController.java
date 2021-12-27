package com.bitc.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.board.dto.thymeleaf.MemberDto;

@Controller
public class ThymeleafController {

	@RequestMapping("/thmeleaf")
	public String thymeleafIndext() throws Exception{
		return "/thmeleaf/index";
	}
	
	@RequestMapping("/thmeleaf/value1")
	public ModelAndView thmeleafValue1() throws Exception {
		ModelAndView mv = new ModelAndView("/thmeleaf/value1");
		
		MemberDto member = new MemberDto();
		member.setUserId("tester01");
		member.setUserPw("bitc1234");
		member.setUserEmail("tester01@bitc.co.kr");
		member.setUserName("테스터01");
		
		List<MemberDto> memberList = new ArrayList<MemberDto>();
		memberList.add(member);
		memberList.add(member);
		memberList.add(member);
		
		mv.addObject("member", member);
		mv.addObject("image", "photo-2.jpg");
		mv.addObject("memberList", "memberList");
		
		return mv;
	}
}
