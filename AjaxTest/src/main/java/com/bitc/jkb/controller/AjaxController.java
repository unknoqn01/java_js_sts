package com.bitc.jkb.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.jkb.dto.CalDto;

@Controller
public class AjaxController {
	
	@RequestMapping("/")
	public String index() throws Exception{
		return "index";
	}
	
	@RequestMapping("/sync/calInput.do") 
	public String calInput() throws Exception {
		return "sync/calInput";
	}
	
	@RequestMapping("/sync/calResult.do") 
	public ModelAndView calResult(CalDto cal) throws Exception {
		
		ModelAndView mv = new ModelAndView("/sync/calResult");
		
		cal.setResult(cal.getNum1() + cal.getNum2());
		mv.addObject("cal", cal);
		
		return mv;
	}
	
	@RequestMapping("/ajax/calInput.do")
	public String ajaxCalInput() throws Exception{
		return "/ajax/calInput";
	}

//	@ResponseBody : 해당 어노테이션을 사용 시 View를 반환하지 않고 데이터 자체를 반환
	@ResponseBody
//	value : RequestMapping 어노테이션에 여러개의 옵션을 사용할 경우 구분하기 위한 속성명, 클라이언트에서 요청하기 위한 URL을 입력하는 속성, RequestMapping에 단 하나의 속성만 사용시 valye가 기본이며, 삭제 가능함
//	method : RequestMapping 어노테이션의 옵션 중 하나로 클라이언트와 통신 시 사용하는 데이터 전송 방식을 구분하기 위한 것, 미입력 시 자동 판단  
	@RequestMapping(value="ajax/calResult.do", method=RequestMethod.POST)
	public Object ajaxCalResult(CalDto cal) throws Exception {
//		HashMap은 키와 값이 1:1로 매칭되어 있는 데이터 타입
//		하나의 변수명으로 여러개의 데이터를 저장할 수 있는 데이터 타입
//		Javascript의 object 타입과 비슷함, json데이터로 변환이 쉬움 		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("num1", cal.getNum1());
		map.put("num2", cal.getNum2());
		map.put("result", cal.getNum1() + cal.getNum2());
		
		return map;
	}
	
	@RequestMapping(value="/ajax/ajaxTest.do", method=RequestMethod.GET)
	public String ajaxTextInput() throws Exception {
		return "/ajax/cal";
	}
	
	@ResponseBody
	@RequestMapping("/ajax/ajaxTest.do") 
	public Object ajaxTest() throws Exception {
		return "ajax Test text!!";
	}
	
	@RequestMapping(value="/ajax/test.do", method=RequestMethod.GET)
	public String test() throws Exception {
		return "/ajax/test";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax/atest.do", method=RequestMethod.POST) 
	public Object ajaxCalTest(
			@RequestParam("num1") int num1,
			@RequestParam("num2") int num2,
			@RequestParam("cal") String cal
			) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int result = 0;
		
		switch (cal) {
		case "+": result = num1 + num2 ; break;
		case "-": result = num1 - num2 ; break;
		case "*": result = num1 * num2 ; break;
		case "/": result = num1 / num2 ; break;
		}
		
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("result", result);
		
		return map;
	}	
	
 	
}
