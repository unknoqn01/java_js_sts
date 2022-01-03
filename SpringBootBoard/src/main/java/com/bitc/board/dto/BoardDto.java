package com.bitc.board.dto;

import java.util.List;

import lombok.Data;

// 롬복이란?
// 데이터 베이스와 매핑되는 dto 객체를 생성 시 getter/setter를 자동으로 생성해줌

// getter/setter/toString 메서드를 자동으로 생성해 줌
@Data
public class BoardDto {

	private int idx;
	private String title;
	private String contents;
	private String creatorId;
	private String createdDate;
	private String updateId;
	private String updatedDate;
	private int hitCnt;
	private String passwd;
//	첨부파일에 대한 정보를 저장하기 위한 멤버 변수를 추가함
	private List<BoardFileDto> fileList;
}






