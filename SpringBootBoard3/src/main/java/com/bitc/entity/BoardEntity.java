package com.bitc.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

// 해당 클래스가 JPA 엔티티임을 나타냄
// mybatis 사용 시 DB 테이들의 데이터와 연동하기 위해 사용하는 DTO와 비슷한 기능
@Entity
// 데이터베이스의 테이블과 연동, name속성을 실제 DB의 테이블명
// jpa가 데이터 테이블을 생성 시 name 속성의 값으로 테이블을 생성함
@Table(name="t_jpa_board")
@NoArgsConstructor
@Data
public class BoardEntity {

//		해당 테이블의 기본키로 설정
		@Id
//		자동으로 값을 카운트, GenerationType을 AUTO로 설정 시 데이터 베이스에서 제공하는 기본키 생성 방식을 따름		
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int idx;
		
//		해당 속성이 컬럼임을 설정
//		nullable = false 는 not null 속성을 지정한다는 의미		
		@Column(nullable=false)
		private String title;
		
		@Column(nullable=false)
		private String contents;
		
		@Column(nullable=false)
		private int hitCnt = 0;
		
		@Column(nullable=false)
		private String creatorId;
		
		@Column(nullable=false)
		private LocalDateTime createDate = LocalDateTime.now();
		
		private String updatorId;
		
		private LocalDateTime updateDate;
		
		
}
