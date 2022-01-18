package com.bitc.dto;

import lombok.Data;

@Data
public class BoardDto {
	
	private int idx; 
	private String userId;
	private String title;
	private String contents; 
	private String createdDate; 
	private String deletedYn;

}
