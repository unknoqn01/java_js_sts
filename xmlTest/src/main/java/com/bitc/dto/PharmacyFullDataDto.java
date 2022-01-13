package com.bitc.dto;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

// @XmlRootElement : JAXB 에서 지원하는 어노테이션
// 부모가 되는 태그를 지정함
// @XmlElement : JAXB 에서 지원하는 어노테이션
// 자식 태그를 지정함
// @XmlAttribute : field나 property를 속성으로 매핑
// name 속성 : 실제 xml 데이터의 태그명과 해당 클래스 및 멤버를 연동할때 사용

// @XmlAccessorType : xml 데이터를 어떤 방법으로 매핑할지 설정
// 해당 어노테이션을 사용하지 않을 경우 기본 값으로 PUBLIC_MEMBER를 사용함
// 롬복과 함께 사용 시 @XmlAccessorType(XmlAccessType.FIELD)를 사용해야 함
// 설정값 : XmlAccessType.None - @XmlElement를 사용한 field와 property 만 매핑
//		   XmlAccessType.FIELD - 모든 field를 매핑
//		   XmlAccessType.PROPERTY - 모든 property를 매핑
//		   XmlAccessType.PUBLIC_MEMBER - public field와 property를 매핑
@XmlRootElement(name="response")
public class PharmacyFullDataDto {

	private PharmacyFullDataHeaderDto header;
	private PharmacyFullDataBodyDto body;
	
	@XmlElement(name="header")
	public PharmacyFullDataHeaderDto getHeader() {
		return header;
	}
	
	public void setHeader(PharmacyFullDataHeaderDto header) {
		this.header = header;
	}
	
	@XmlElement(name="body")
	public PharmacyFullDataBodyDto getBody() {
		return body;
	}
	
	public void setBody(PharmacyFullDataBodyDto body) {
		this.body = body;
	}
}






