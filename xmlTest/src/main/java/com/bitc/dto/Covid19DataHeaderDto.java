package com.bitc.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement(name="header")
@XmlAccessorType(XmlAccessType.FIELD)
public class Covid19DataHeaderDto {

	// 롬복 사용 시 @XmlElement 어노테이션에 name을 반드시 입력해야함
	@XmlElement(name="resultCode")
	private String resultCode;
	
	@XmlElement(name="resultMsg")
	private String resultMsg;
	
}
