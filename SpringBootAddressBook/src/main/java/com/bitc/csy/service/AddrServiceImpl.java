package com.bitc.csy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.csy.dto.AddrDto;
import com.bitc.csy.mapper.AddrMapper;

@Service
public class AddrServiceImpl implements AddrService {

	@Autowired
	private AddrMapper addrMapper;
	
	@Override
	public List<AddrDto> selectAddrList() throws Exception {
		List<AddrDto> list = addrMapper.selectAddrList();
		return list;
	}
	
	@Override
	public AddrDto selectAddrDetail(int seq) throws Exception {
		AddrDto addr = addrMapper.selectAddrDetail(seq);
		return addr;
	}

	@Override
	public void deleteAddr(int seq) throws Exception {
		addrMapper.deleteAddr(seq);
		
	}
	
	@Override
	public void updateAddr(AddrDto dto) throws Exception {
		addrMapper.updateAddr(dto);
	}
	
	@Override
	public void insertAddr(AddrDto dto) throws Exception {
		addrMapper.insertAddr(dto);
	}
}













