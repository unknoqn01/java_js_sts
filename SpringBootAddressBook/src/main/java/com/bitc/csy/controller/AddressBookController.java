package com.bitc.csy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.csy.dto.AddrDto;
import com.bitc.csy.service.AddrService;

@Controller
public class AddressBookController {

	@Autowired
	private AddrService addrService;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
	@RequestMapping("/addr/list.do")
	public ModelAndView addrList() throws Exception {
		ModelAndView mv = new ModelAndView("/addr/addrList");
		
		List<AddrDto> addrList = addrService.selectAddrList();
		mv.addObject("addrList", addrList);
		
		return mv;
	}
	
	@RequestMapping("/addr/detail.do")
	public ModelAndView addrDetail(@RequestParam("seq") int seq) throws Exception {
		ModelAndView mv = new ModelAndView("/addr/addrDetail");
		
		AddrDto addr = addrService.selectAddrDetail(seq);
		mv.addObject("addr", addr);
		
		return mv;
	}
	
	@RequestMapping("/addr/delete.do")
	public String addrDelete(@RequestParam("seq") int seq) throws Exception {
		addrService.deleteAddr(seq);
		return "redirect:/addr/list.do";
	}
	
	@RequestMapping("/addr/update.do")
	public String addrUpdate(AddrDto dto) throws Exception {
		addrService.updateAddr(dto);
		return "redirect:/addr/list.do";
	}
	
//	문제 1) 수정 기능을 구현하세요
	
//	문제 2) 주소록 등록 UI 및 기능을 구현하세요
	
//	문제 3) 연락처 상세보기 UI를 부트스트랩의 card 를 이용하여 출력하는 형태로 변경하세요
//	ps. 1) 이미지는 아무것이나 사용 가능
//	ps. 2) 모든 input 태그는 form-control-plaintext로 구현
//	ps. 3) 목록, 수정, 삭제 버튼은 card 내부의 가장 아래쪽에 구현

//	추가문제
//	문제 4) 연락처 상세보기 UI 중 성별 부분을 단순 text 출력이 아닌 방식으로 구현
//	ps ) input type="radio", 성별에 따른 이미지 변경, M or F를 남자 or 여자로 출력
}














