package com.bitc.board.dto;

import lombok.Data;

// 롬북이란>?
// 데이터 베이스와 매핑되는 dto 객체를 생성 시 getter/setter를 자동으로 생성해줌
@Data
public class BoardDto {

		private int idx;
		private String title;
		private String contents;
		private String creatorId;
		private String createdDate;
		private String createId;
		private String updatedDate;
		private int hitCnt;
		private String passwd;
}
