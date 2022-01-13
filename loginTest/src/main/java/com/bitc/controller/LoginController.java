package com.bitc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.dto.MemberDto;
import com.bitc.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/")
	public String index() throws Exception {
		return "index";
	}
	
//	사용자가 로그인하기 위해 보는 페이지
	@RequestMapping(value="/login/login", method=RequestMethod.GET)
	public String login() throws Exception {
		return "/login/login";
	}
	
//	사용자 입력정보를 바탕으로 DB에서 사용자 정보가 있는지 확인하는 페이지
	@RequestMapping(value="/login/loginCheck", method=RequestMethod.POST)
	public String loginCheck(MemberDto member, HttpServletRequest request) throws Exception {
//		사용자 정보 조회
//		사용자 정보가 있을 경우 1이 반환되고, 없으면 0이 반환됨
		int count = loginService.selectMemberInfoYn(member.getUserId(), member.getUserPw());
		
//		사용자 정보가 있을 경우 세션에 필수 정보를 저장
		if (count == 1) {
//			HttpSession 클래스 타입의 변수를 선언하고 내장객체 request에서 세션 정보를 가져옴
			HttpSession session = request.getSession();
//			세션에 중요 정보를 저장함
			session.setAttribute("userId", member.getUserId());
//			세션 정보 지속 시간
			session.setMaxInactiveInterval(30);
			
//			로그인 이후에 접속할 수 있는 페이지로 이동
			return "redirect:/login/loginOK";
		}
		else {
//			로그인 실패 시 오류 페이지로 이동
			return "redirect:/login/loginFail";
		}
	}
	
//	로그인 시에만 접속할 수 있는 페이지
	@RequestMapping(value="/login/loginOK", method=RequestMethod.GET)
	public String loginOK(HttpServletRequest request) throws Exception {
//		해당 접속 시 매번 세션을 확인하여 세션 정보가 있을 경우에만 지정된 페이지를 열어주고, 세션 정보가 없을 경우 오류 페이지로 이동
//		HttpSession session = request.getSession();
//		
//		if (session.getAttribute("userId") != null) {
//			return "/login/loginOK";
//		}
//		else {
//			return "/login/loginFail";
//		}
		return "/login/loginOK";
	}
	
//	로그 아웃 버튼 클릭 시 동작하는 페이지
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















