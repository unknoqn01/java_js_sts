package com.bitc.dto;

import lombok.Data;

@Data
public class GuestDto {

	private int seq; 
	private String guestName; 
	private String guestPw;
	private String guestContents; 
	private String guestCreatedDt;
	
}
