package com.bitc.test.contoller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@RequestMapping("/")
	public String hello() {
		return "hello world!";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test page";
	}
}
