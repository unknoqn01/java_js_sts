package com.bitc.thmeleaf.service;

import java.util.List;

import com.bitc.thmeleaf.dto.MemberDto;

public interface Thymeleafservice {

	List<MemberDto> selectMemberList() throws Exception;
}
