package com.bitc.service;

public interface LoginService {

	int selectMemberInfoYn(String userId, String userPw) throws Exception;

}
