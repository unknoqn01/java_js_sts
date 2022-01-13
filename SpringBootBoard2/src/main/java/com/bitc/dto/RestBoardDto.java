package com.bitc.dto;

import lombok.Data;

@Data
public class RestBoardDto {
	
	private int idx;
	private String title;
	private String contents;
	private String hitCnt;
	private String creatorId;
	private String createdDate;
	private String updateId;
	private String updatedDate;
	private String passwd;
}
