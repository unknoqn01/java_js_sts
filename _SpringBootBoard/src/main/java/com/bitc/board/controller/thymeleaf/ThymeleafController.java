package com.bitc.board.controller.thymeleaf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.board.dto.thymeleaf.MemberDto;

@Controller
public class ThymeleafController {

	@RequestMapping("/thymeleaf")
	public String thymeleafIndex() throws Exception {
		return "/thymeleaf/index";
	}
	
	@RequestMapping("/thymeleaf/value1")
	public ModelAndView thymeleafValue1() throws Exception {
		ModelAndView mv = new ModelAndView("/thymeleaf/value1");
		
		MemberDto member = new MemberDto();
		member.setUserId("tester01");
		member.setUserPw("bitc1234");
		member.setUserEmail("tester01@bitc.co.kr");
		member.setUserName("테스터01");
		MemberDto member2 = new MemberDto();
		member.setUserId("tester02");
		member.setUserPw("bitc1234");
		member.setUserEmail("tester02@bitc.co.kr");
		member.setUserName("테스터02");
		MemberDto member3 = new MemberDto();
		member.setUserId("tester03");
		member.setUserPw("bitc1234");
		member.setUserEmail("tester03@bitc.co.kr");
		member.setUserName("테스터03");
		MemberDto member4 = new MemberDto();
		member.setUserId("tester04");
		member.setUserPw("bitc1234");
		member.setUserEmail("tester04@bitc.co.kr");
		member.setUserName("테스터04");
		
		List<MemberDto> memberList = new ArrayList<MemberDto>();
		memberList.add(member);
		memberList.add(member2);
		memberList.add(member3);
		memberList.add(member4);
		
		mv.addObject("member", member);
		mv.addObject("image", "photo-2.jpg");
		mv.addObject("memberList", memberList);
		
		return mv;
	}
}












