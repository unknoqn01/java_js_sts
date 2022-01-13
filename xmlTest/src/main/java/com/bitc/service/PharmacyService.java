package com.bitc.service;

import java.util.List;

import com.bitc.dto.PharmacyFullDataItemDto;

public interface PharmacyService {
	
	List<PharmacyFullDataItemDto> getItemList() throws Exception;
}
