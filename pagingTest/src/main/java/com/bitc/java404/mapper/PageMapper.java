package com.bitc.java404.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.java404.dto.EmployeesDto;
import com.github.pagehelper.Page;

@Mapper
public interface PageMapper {

	Page<EmployeesDto> selectEmpList() throws Exception;

}
