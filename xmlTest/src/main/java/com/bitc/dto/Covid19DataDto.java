package com.bitc.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data // 롬복 사용
@XmlRootElement(name="response") // xml 최상위 root 태그와 매핑
@XmlAccessorType(XmlAccessType.FIELD) // 롬복과 JAXB 를 동시에 사용하기 위해서 설정
public class Covid19DataDto {

	@XmlElement(name="header")
	private Covid19DataHeaderDto header;
	
	@XmlElement(name="body")
	private Covid19DataBodyDto body;
}
