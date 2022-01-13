package com.bitc.quizbjg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.quizbjg.dto.MemberDto;
import com.bitc.quizbjg.service.BoardService;

@Controller
public class LoginController {

	@Autowired
	private BoardService boardService;
	
	// 로그인 페이지
	@RequestMapping(value="/login/login", method=RequestMethod.GET)
	public String login() throws Exception {
		return "/login/login";
	}
	
	// 회원 가입 페이지
	@RequestMapping(value="login/signUp", method=RequestMethod.GET)
	public String signUp() throws Exception {
		return "/login/signUp";
	}
	
	// 사용자 등록
	@RequestMapping(value="login/signUp", method=RequestMethod.POST)
	public String memberSignUp(MemberDto member) throws Exception {
		boardService.insertMember(member);
		return "/board/boardList";
	}
	
	// 사용자 조회
	@RequestMapping(value="/login/loginCheck", method=RequestMethod.POST)
	public String loginCheck(MemberDto member, HttpServletRequest request) throws Exception {

		int count = boardService.selectMemberInfoYn(member.getUserId(), member.getUserPw());
		
		if (count == 1) {

			HttpSession session = request.getSession();

			session.setAttribute("userId", member.getUserId());

			return "redirect:/board/boardList";
		}
		else {
			return "redirect:/login/loginFail";
		}
	}

	// 로그인 성공
	@RequestMapping(value="/login/loginOK", method=RequestMethod.GET)
	public String loginOK(HttpServletRequest request) throws Exception {

		return "/board/boardList";
	}
	
	@RequestMapping(value="/login/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.invalidate();
		
		return "/login/logout";
	}
	
//	로그인 실패 시 동작하는 페이지
	@RequestMapping(value="/login/loginFail", method=RequestMethod.GET)
	public String loginFail() throws Exception {
		return "/login/loginFail";
	}
	
}















