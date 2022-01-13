package com.bitc.java404.service;

import com.bitc.java404.dto.EmployeesDto;
import com.github.pagehelper.Page;

public interface PageService {

	Page<EmployeesDto> selectEmpList(int pageNum) throws Exception;

}
