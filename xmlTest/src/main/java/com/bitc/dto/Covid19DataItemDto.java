package com.bitc.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@XmlRootElement(name="item")
@XmlAccessorType(XmlAccessType.FIELD)
public class Covid19DataItemDto {

	@XmlElement(name="seq")
	private int seq;
	
	@XmlElement(name="stateDt")
	private String stateDt;
	
	@XmlElement(name="accExamCnt")
	private int accExamCnt;
	
	@XmlElement(name="decideCnt")
	private int decideCnt;
	
	@XmlElement(name="deathCnt")
	private int deathCnt;
	
	@XmlElement(name="createDt")
	private String createDt;
}
