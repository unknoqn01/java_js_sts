package com.bitc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.dto.MemberDto;
import com.bitc.dto.MsgDto;
import com.bitc.service.BoardService;

@Controller
public class LoginController {
	
	@Autowired
	private BoardService boardService;

	// 회원 가입
	@RequestMapping(value = "/login/signUp", method = RequestMethod.GET)
	public String signUp() throws Exception {
		return "/login/signUp";
	}
	
	// 회원 가입 프로세스
	@RequestMapping(value = "/login/signUp", method = RequestMethod.POST)
	public String signUpProcess(MemberDto memberDto, @RequestParam("id-val") int idVal) throws Exception {
		if (idVal == 0) {
			boardService.signUp(memberDto);
			boardService.createMsgStrogae(memberDto.getUserId());	
			return "/board/boardList";
		}
		else {
			return "/login/signUp";
		}
	}
	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/login/idCheck", method=RequestMethod.POST)
	public Object idCheckProcess(@RequestParam("userId")String userId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int count = boardService.idCheck(userId);
		
		map.put("count", count);
		
		return map;
	}
	
	
	// 로그인
	@RequestMapping("/login/login")
	public String login(MemberDto memberDto, HttpServletRequest request) throws Exception {

		int count = boardService.selectMemberInfo(memberDto.getUserId(), memberDto.getUserPw());
		
		if(count == 1) {
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", memberDto.getUserId());
			
		return "redirect:/board/boardList";
		}
		else return "redirect:/board/boardList";
	
	}
	
	// 로그 아웃
	@RequestMapping("/login/logout")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.invalidate();
		
		return "redirect:/board/boardList";
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/login/findPw", method=RequestMethod.GET)
	public String findpw() throws Exception {
		return "/login/findpw";
	}
	
	//비밀번호 찾기 프로세스
	@ResponseBody
	@RequestMapping(value = "/login/findPw", method=RequestMethod.POST)
	public Object findpwProcess(MemberDto memberDto) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int count = boardService.findpw(memberDto);
		
		if(count == 1) { 
			Random rnd =new Random();
			StringBuffer buf =new StringBuffer();

			for(int i=0;i<10;i++){
					
			    if(rnd.nextBoolean()){
			    	// 영어 소문자 ASCII(97~122)
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }
			    else{
			    	// 숫자
			        buf.append((rnd.nextInt(10)));
			    }
			}
			
			String userPw = buf.toString();
			map.put("tempPw", userPw);

			boardService.updateTempPw(memberDto.getUserId(), userPw);
		} 
		map.put("count", count);
		
		return map;
	}
	
	// 메세지 보기
	@RequestMapping("/login/readMsg")
	public ModelAndView readMsg(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		ModelAndView mv = new ModelAndView("/login/readMsg");
		List<MsgDto> msg = boardService.selectMsg(userId);
		
		mv.addObject("data", msg);
		
		return mv;
	}
	
	// 메세지 보내기
	@RequestMapping(value="/login/sendMsg", method=RequestMethod.GET)
	public String sendMsg() throws Exception {
		
		return "/login/sendMsg";
	}
	
	// 메세지 보내기 프로세스
	@RequestMapping(value="/login/sendMsg", method=RequestMethod.POST)
	public String sendMsgProcess(MsgDto msg) throws Exception {
		boardService.sendMsg(msg);
		
		return "/login/sendMsg";
	}
	
	// 마이 페이지
	@RequestMapping(value = "/login/myPage", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/myPage");

		HttpSession session = request.getSession();
		String userId =(String) session.getAttribute("userId");
		MemberDto memberDto = boardService.selectMemberInfoMy(userId); 
		mv.addObject("data", memberDto);
		
		return mv;
	}
	
	// 마이페이지 수정
	@RequestMapping(value = "/login/myPage", method = RequestMethod.PUT)
	public String myPageEdit(MemberDto memberDto) throws Exception {
		boardService.updateMy(memberDto);
		return "redirect:/board/boardList";
	}
	
	// 마이페이지 탈퇴
	@RequestMapping(value = "/login/myPage/{seq}", method = RequestMethod.DELETE)
	public String myPageDel(@PathVariable("seq") int seq, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		boardService.deleteBoardUser(userId);
		boardService.deleteMember(seq);
		return "redirect:/login/logout";
	}
	
}
