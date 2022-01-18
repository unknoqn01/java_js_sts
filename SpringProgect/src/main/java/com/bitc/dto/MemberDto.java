package com.bitc.dto;

import lombok.Data;

@Data
public class MemberDto {

	private int seq; 
	private String userId; 
	private String userPw; 
	private String userPhone; 
	private String userEmail; 
	private String createdDate;
}
