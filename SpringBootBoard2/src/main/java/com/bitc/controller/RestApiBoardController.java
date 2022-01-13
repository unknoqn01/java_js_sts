package com.bitc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.dto.RestBoardDto;
import com.bitc.service.RestBoardService;

// @RestController : @Controller 와 @ResponseBody가 합쳐진 형태의 어노테이션, @ResponseBody 어노테이션을 사용하지 않아도 클라이언트에게 데이터만 전송함
// @Controller 어노테이션을 사용하면 클라이언트에게 데이터를 전송 시 View와 Model을 함께 전송함
// @ResponseBody 어노테이션을 사용하면 클라이언트에게 데이터만 전송함
// Rest API 란 웹 브라우저가 아닌 다른 디바이스와 통신이 가능하도록 연결 창구를 만들어주는 것
// 단순 웹 브라우저만 아니라 안드로이드 및 IOS의 앱과 서버와의 통신이 가능함
@RestController
public class RestApiBoardController {

	@Autowired
	private RestBoardService restBoardService;
	
//	게시물 리스트를 전송하는 메서드
//	원래는 view와 model을 동시에 전송하여야 하나 rest api 방식을 사용하므로써 데이터만 전송하는 방식으로 변경됨
	@RequestMapping(value="/api/board", method=RequestMethod.GET)
	public List<RestBoardDto> openBoardList() throws Exception{
		return restBoardService.selectBoardList();
	}
	
//	@RequestBody : 클라이언트에서 서버로 데이터를 전송 시 GET, POST 방식이 존재하고, POST 방식은 데이터를 HTTP 프로토콜의 Body 영역에 저장하여 전송함
//	이때 @RequestBody는 매개변수로 전송된 데이터가 반드시 HTTP 프로토콜의 Body 영역에 있어야 한다는 것을 나타냄
//	Rest 방식을 사용 시 POST, PUT을 사용하면 @RequestBody, GET을 사용 사 @RequestParam을 사용해야 함
	@RequestMapping(value="/api/board/write", method=RequestMethod.POST)
	public void insertBoard(@RequestBody RestBoardDto board) throws Exception {
		restBoardService.insertBoard(board);
	}
	
	@RequestMapping(value="/api/board/{idx}", method=RequestMethod.GET)
	public RestBoardDto openBoardDetail(@PathVariable("idx") int idx) throws Exception {
		return restBoardService.selectBoardDetail(idx);
	}
	
	@RequestMapping(value="/api/board/{idx}", method=RequestMethod.DELETE)
	public String deleteBoard(@PathVariable("idx") int idx) throws Exception {
		restBoardService.deleteBoard(idx);
		return "redirect:/restBoard";
	}
	
	@RequestMapping(value="/api/board/{idx}", method=RequestMethod.PUT)
	public String updateBoard(@RequestBody RestBoardDto board) throws Exception {
		restBoardService.updateBoard(board);
		return "redirect:/restBoard";
	}
}














