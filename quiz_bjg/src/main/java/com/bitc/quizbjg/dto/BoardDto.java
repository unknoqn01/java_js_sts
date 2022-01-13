package com.bitc.quizbjg.dto;

import lombok.Data;

@Data
public class BoardDto {
	
	private int idx; 
	private String title;
	private String contents; 
	private String ceatorId; 
	private String createdDt; 
	private String updatorId; 
	private String updatedDt; 
	private int hitCnt;
	private String deletedYn;
	
}
