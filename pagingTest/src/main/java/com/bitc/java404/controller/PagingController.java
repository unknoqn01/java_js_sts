package com.bitc.java404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.java404.dto.EmployeesDto;
import com.bitc.java404.service.PageService;
import com.github.pagehelper.PageInfo;

@Controller
public class PagingController {

	@Autowired
	private PageService pageService;
	
	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}
	
//	required=false : 해당 매개변수가 없이 접속했을 경우에도 오류를 발생시키지 않음
//	defaultValue : 기본 값 설정
	@RequestMapping("/page")
	public ModelAndView paging(@RequestParam(required = false, defaultValue= "1") int pageNum) throws Exception {
		ModelAndView mv = new ModelAndView("/page");
		
//		PageInfo : 페이지 헬퍼가 가지고 있는 현재 상태 클래스, List하고 비슷, 현재 페이지의 페이징 정보와 전체 데이터를 리스트로 만들어서 반환
//		pageNum : int, 현재 페이지
//		pageSize : int, 페이지당 수량
//		size : int, 현재 페이지 수
//		startRow : long, 현재 페이지의 첫번째 요소가 데이터베이스에 있는 줄 번호
//		endRow : long, 현재 페이지의 마지막 요소가 데이터베이스에 있는 줄 번호
//		pages : int, 전체 페이지 수
//		prePage : int, 이전 페이지
//		nextPage : int, 다음 페이지
//		isFirstPage = false : boolean, 첫번째 페이지 여부
//		isLastPage = false : boolean, 마지막 페이지 여부
//		hasPreviousPage = false : boolean, 이전 페이지 존재 여부
//		hasNextPage = false : boolean, 다음 페이지 존재 여부
//		navigatePages : int, 내비게이션페이지 번호
//		navigatePageNums : int[], 모든 내비게이션 페이지 번호
//		navigateFristPage : int, 내비게이션 바의 첫 페이지
//		navigateLastPage : int, 내비게이션 바의 마지막 페이지
		
		PageInfo<EmployeesDto> page = new PageInfo<>(pageService.selectEmpList(pageNum), 5); // 두번째 매개변수는 페이징 수
		mv.addObject("users", page);
		
		return mv;
	}
}











