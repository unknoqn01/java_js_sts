package com.bitc.java404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.java404.dto.EmployeesDto;
import com.bitc.java404.mapper.PageMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class PageServiceImpl implements PageService {

	@Autowired
	private PageMapper pageMapper;
	
	@Override
	public Page<EmployeesDto> selectEmpList(int pageNum) throws Exception{
		
//		페이지 헬퍼를 사용하여 페이징을 구현함
//		startPage(pageNum, 10) : 첫번 매개변수는 현재 페이지 번호, 두번째 매개변수는 한 페이지에 출력되는 데이터 수
		PageHelper.startPage(pageNum, 10);
		return pageMapper.selectEmpList();
	}

}
