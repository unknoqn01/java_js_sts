package com.bitc.quizbjg.dto;

import lombok.Data;

@Data
public class MemberDto {

	private int seq; 
	private String userId;
	private String userPw; 
	private String userName; 
	private String userEmail; 
	private int level; 
	private String deletedYn;
}
