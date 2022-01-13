package com.bitc.jkb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.jkb.dto.TestbookDto;
import com.bitc.jkb.mapper.TestbookMapper;

@Service
public class TestbookImpl implements TestbookService {
	
	@Autowired
	private TestbookMapper testbookMapper;
	
	@Override
	public void insert(TestbookDto dto) throws Exception {
		testbookMapper.insert(dto);
	}
	
}
