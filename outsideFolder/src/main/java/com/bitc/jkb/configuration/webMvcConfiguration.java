package com.bitc.jkb.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class webMvcConfiguration implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	
//		addResourceHandlers : 스프링부트에서 확인할 폴더 위치 설정
//		addResourceLocations : 실제 시스템의 폴더 위치, 
//		윈도우 시스템의 경우 'file:///경로' 형태로 사용
//		file:///C:/java404/img/
//		리눅스 시스템의 경우 'file:/경로' 형태로 사용, rot 에서 시작하는 전체 경로
//		file:/C:/java404/img/	
//		'/', '\' 구분없이 사용가능		
		registry.addResourceHandler("/img/**"). /*이 이름으로 html에서 사용가능*/
		addResourceLocations("file:///C:/java404/img/");

		registry.addResourceHandler("/img2/**").
		addResourceLocations("file:///C:/java404/img2/");	
	}
	
}
