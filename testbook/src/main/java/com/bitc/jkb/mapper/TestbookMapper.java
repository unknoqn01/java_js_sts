package com.bitc.jkb.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.jkb.dto.TestbookDto;

@Mapper
public interface TestbookMapper {

	void insert(TestbookDto dto) throws Exception;

}
