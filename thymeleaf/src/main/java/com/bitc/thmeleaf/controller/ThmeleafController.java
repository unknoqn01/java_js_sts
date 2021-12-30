package com.bitc.thmeleaf.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.thmeleaf.dto.MemberDto;
import com.bitc.thmeleaf.service.Thymeleafservice;


@Controller
public class ThmeleafController {

	@Autowired
	private Thymeleafservice service;

	@RequestMapping("/")
	public String index() throws Exception {
		return "/index";
	}

	@RequestMapping("/test1")
	public String test1(Model model) throws Exception {
//			데이터를 저장하고 있는 모델 객체를 사용하여 클라이언트로 데이터를 전송함
//			addAttribute(식별자이름, 실제 데이터) 형식으로 사용함 
		List<MemberDto> members = service.selectMemberList();
		model.addAttribute("value1","값 1");
		model.addAttribute("value2","값 2");
		model.addAttribute("members", members);
		model.addAttribute("active", false);
		
		return "test1";
		}
	
	@RequestMapping("/test2")
	public ModelAndView test2() throws Exception {
		ModelAndView mv = new ModelAndView("/test2");
		
		MemberDto member = new MemberDto();
		member.setUserId("test1"); 
		member.setUserPw("bitc1234"); 
		member.setUserName("데트스1"); 
		member.setUserEmail("test1@bitc.co.kr"); 

		mv.addObject("member", member);
		
		return mv;
	}

	@RequestMapping("/test3")
	public ModelAndView test3() throws Exception {
		ModelAndView mv = new ModelAndView("/test3");

		List<MemberDto> memberList = service.selectMemberList();
		
		mv.addObject("memberList", memberList);
				
		return mv;
	}
	
	@RequestMapping("/test4")
	public ModelAndView test4() throws Exception {
		ModelAndView mv = new ModelAndView("/test4");

		
		List<MemberDto> memberList = new ArrayList<MemberDto>();
//		List<MemberDto> memberList = null;
		
		mv.addObject("memberList", memberList);
				
		return mv;
	}
	
	@RequestMapping("/layout")
	public String layout() throws Exception {
		return "/main_layout";
	}
	
	@RequestMapping("/basicLayout")
	public String basicLayout() throws Exception {
		return "/basicLayout";
	}
	
	@RequestMapping("/includeLayout")
	public String includeLayout() throws Exception {
		return "/includeLayout";
	}
	
}
