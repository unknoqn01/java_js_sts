package com.bitc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public int selectMemberInfoYn(String userId, String userPw) throws Exception {
		return loginMapper.selectMemberInfoYn(userId, userPw);
	}

}
