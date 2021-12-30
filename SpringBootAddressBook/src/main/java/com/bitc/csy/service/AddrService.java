package com.bitc.csy.service;

import java.util.List;

import com.bitc.csy.dto.AddrDto;

public interface AddrService {

	List<AddrDto> selectAddrList() throws Exception;

	AddrDto selectAddrDetail(int seq) throws Exception;

	void deleteAddr(int seq) throws Exception;

	void updateAddr(AddrDto dto) throws Exception;
}
