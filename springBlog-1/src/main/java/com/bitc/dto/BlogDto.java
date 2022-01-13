package com.bitc.dto;

import lombok.Data;

@Data
public class BlogDto {

	private int idx; 
	private String title;  
	private String contents;
	private String creatorId; 
	private String createdDt; 
	private String updatorId; 
	private String updatedDt; 
	private int hitCnt; 
	private String deletedYn;
	
}
