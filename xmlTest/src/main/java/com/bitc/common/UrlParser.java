package com.bitc.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class UrlParser {

//	@Value 어노테이션은 application.properties 파일 내에 설정된 값을 가져올 수 있음
	@Value("${custom.serviceKey}")
	private String serviceKey;
	
	private String endPoint = "http://openapi.data.go.kr/openapi/service/rest/Covid19";
	private String serviceFunc = "/getCovid19InfStateJson";
	private String keyFunc = "?serviceKey=";
	private String pageNo = "&pageNo=1";
	private String rows = "&numOfRows=10";
	private String startCreateDt = "&startCreateDt=";
	private String endCreateDt = "&endCreateDt=";
	
	public String getUrl(String startDt, String endDt) {
		String strUrl = endPoint + serviceFunc + keyFunc + serviceKey + pageNo + rows + startCreateDt + startDt + endCreateDt + endDt;
		
		return strUrl;
	}
}




