package com.bitc.thmeleaf.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.thmeleaf.dto.MemberDto;

@Service
public class ThmeleafServiceimpl implements Thymeleafservice {
	
	@Override
	public List<MemberDto> selectMemberList() throws Exception {
		List<MemberDto> memberList = createMemberList(5);
		return createMemberList(5);
	}

	private List<MemberDto> createMemberList(int count) {
		List<MemberDto> memberList = new ArrayList<>();
		for (int i = 0; i < count; i++) {
			MemberDto member = new MemberDto();
			member.setUserId("tester" + (i+1));
			member.setUserPw("bitc1234");
			member.setUserName("테스터" + (i+1));
			member.setUserEmail("tester" + (i+1));
		
			memberList.add(member);
		}
		return memberList;
	}
}
