package com.bitc.service;

import java.util.List;

import com.bitc.dto.Covid19DataItemDto;

public interface Covid19Service {
	List<Covid19DataItemDto> getItemList() throws Exception;

	List<Covid19DataItemDto> getItemListRange(String strUrl) throws Exception;
}
