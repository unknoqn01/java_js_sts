package com.bitc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.common.UrlParser;
import com.bitc.dto.Covid19DataItemDto;
import com.bitc.service.Covid19Service;

@Controller
public class Covid19Controller {
	
	@Autowired
	private Covid19Service covid19Service;
	
	@Autowired
	private UrlParser urlParser;
	
	@RequestMapping("/covid19/toDayInfo")
	public ModelAndView getCovid19Info() throws Exception {
		ModelAndView mv = new ModelAndView("/covid19/covid19info");
		
		List<Covid19DataItemDto> itemList = covid19Service.getItemList();
		mv.addObject("covid19Datas", itemList);
		
		return mv;
	}
	
	@RequestMapping("/covid19/toDayInfoUrlInput")
	public String getCovid19InfoUrlInput() throws Exception {
		return "/covid19/covid19infoUrlInput";
	}
	
	@RequestMapping("/covid19/toDayInfoUrl")
	public ModelAndView getCovid19InfoUrl(@RequestParam("startDt") String startDt, @RequestParam("endDt") String endDt) throws Exception {
		ModelAndView mv = new ModelAndView("/covid19/covid19infoUrl");
		
		String endPoint = "http://openapi.data.go.kr/openapi/service/rest/Covid19";
		String serviceFunc = "/getCovid19InfStateJson";
		String keyFunc = "?serviceKey=";
		String pageNo = "&pageNo=1";
		String rows = "&numOfRows=10";
		String startCreateDt = "&startCreateDt=";
		String endCreateDt = "&endCreateDt=";
		
		String serviceKey = "MQ8moCpDCqz42c3kxwz2LHfm%2BevXvXYOTYnrZjpLTYgYqArm4QD7hxWxCGM%2F24BBmgODLVMFUM6mAAH4XCFQcg%3D%3D";
		
		String strUrl = endPoint + serviceFunc + keyFunc + serviceKey + pageNo + rows + startCreateDt + startDt + endCreateDt + endDt;
		
		List<Covid19DataItemDto> itemList = covid19Service.getItemListRange(strUrl);
		mv.addObject("covid19Datas", itemList);
		
		return mv;
	}

//	ajax 통신을 위해서 필요한 사용자 입력 화면을 보기 위한 부분
	@RequestMapping(value="/covid19/covid19infoUrlAjax", method=RequestMethod.GET)
	public String getCovid19InfoUrlInputAjax() throws Exception {
		return "/covid19/covid19infoUrlAjax";
	}
	
//	실제 ajax 통신을 위한 데이터 전송 부분
	@ResponseBody
	@RequestMapping(value="/covid19/covid19infoUrlAjax", method=RequestMethod.POST)
	public Object getCovid19InfoUrlAjax(@RequestParam("startDt") String startDt, @RequestParam("endDt") String endDt) throws Exception {

		String strUrl = urlParser.getUrl(startDt, endDt);
		
		List<Covid19DataItemDto> itemList = covid19Service.getItemListRange(strUrl);
		
		return itemList;
	}
}












