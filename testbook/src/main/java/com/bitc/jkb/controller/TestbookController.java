package com.bitc.jkb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.jkb.dto.TestbookDto;
import com.bitc.jkb.service.TestbookService;

@Controller
public class TestbookController {

	@Autowired
	private TestbookService testbookService;
	
	@RequestMapping(value="/", method=RequestMethod.GET) 
	public String idx() {
		return "/signUp";
	}
	
	@ResponseBody
	@RequestMapping(value="/", method=RequestMethod.POST) 
	public Object ajax(@RequestParam("area") String area) {
		List<String> listArea = new ArrayList<String>();
		
		if (area.equals("운동")) {
			listArea.add("농구");
			listArea.add("축구");
			listArea.add("배구");
			listArea.add("야구");
		}
		else if(area.equals("요리")) {
			listArea.add("한식");
			listArea.add("양식");
			listArea.add("일식");
			listArea.add("중식");
		} 
		
		return listArea;
	}
	
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST) 
	public Object insert(TestbookDto dto) throws Exception {
		List<String> data = new ArrayList<String>();
		
		testbookService.insert(dto);
		
		data.add(dto.getId());
		
		return data;
	} 
	
}
