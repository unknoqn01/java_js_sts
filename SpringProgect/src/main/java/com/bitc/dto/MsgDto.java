package com.bitc.dto;

import lombok.Data;

@Data
public class MsgDto {
	
	private int seq; 
	private String sendId; 
	private String reciveId; 
	private String msg; 
	private String createdDate;
}
