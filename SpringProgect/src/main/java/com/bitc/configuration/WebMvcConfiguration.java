package com.bitc.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bitc.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		로그인 체크를 위한 클래스가 자동 생성되어서 지정된 패턴의 페이지에 접속 시 controller보다 먼저 실행되어 로그인을 체크함
//		addPathPatterns("패턴") : 인터셉터를 사용할 컨트롤러 선택
//		excludePathPatterns("주소") : 인터셉터를 미적용할 컨트롤러 선택

		
		
		  registry.addInterceptor(new LoginCheckInterceptor())
		  .addPathPatterns("/board/**") 
		  .excludePathPatterns("/board/boardList")
		  .addPathPatterns("/login/**") 
		  .excludePathPatterns("/login/login")
		  .excludePathPatterns("/login/signUp") 
		  .excludePathPatterns("/login/findPw")
		  .excludePathPatterns("/login/idCheck");
		 
		 
	}
}






