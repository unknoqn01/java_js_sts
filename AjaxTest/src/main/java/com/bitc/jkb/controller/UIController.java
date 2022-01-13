package com.bitc.jkb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UIController {
	
	@RequestMapping(value="/ui/selectBox", method=RequestMethod.GET)
	public String selectBox() throws Exception {
		return "/ajax/uiTest";
	}
	
	@ResponseBody
	@RequestMapping(value="/ui/selectBox1", method=RequestMethod.POST)
	public Object box1Selected(@RequestParam("area") String area) throws Exception {
	//	데이터 생성 시 List 타입으로 생성을 했으며 키가 없기 때문에 배열로 인식
		List<String> listArea = new ArrayList<String>();
	
		if (area.equals("서울")) {
			listArea.add("강북구");
			listArea.add("강서구");
			listArea.add("강남구");
			listArea.add("강동구");
		}
		else if(area.equals("대전")) {
			listArea.add("동구");
			listArea.add("서구");
			listArea.add("중구");
			listArea.add("유성구");
		} 
		else if(area.equals("대구")) {
			listArea.add("북구");
			listArea.add("동구");
			listArea.add("남구");
			listArea.add("서구");
		
		}
		else if(area.equals("부산")) {
			listArea.add("부산진구");
			listArea.add("해운대구");
			listArea.add("수영구");
			listArea.add("동래구");
		
		}
		else {
			listArea.add("제주시");
			listArea.add("서귀포");
		}
		
		return listArea;
	}
	
}
