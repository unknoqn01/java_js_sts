package com.bitc.csy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.csy.dto.AddrDto;

@Mapper
public interface AddrMapper {

	public List<AddrDto> selectAddrList() throws Exception;

	public AddrDto selectAddrDetail(int seq) throws Exception;

	public void deleteAddr(int seq) throws Exception;

	public void updateAddr(AddrDto dto) throws Exception;
}
