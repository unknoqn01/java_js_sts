package com.bitc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.dto.BoardDto;
import com.bitc.service.BoardService;
import com.github.pagehelper.PageInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService; 
	
	@RequestMapping("/")
	public String index() throws Exception {
		
		return "index";
	}
	
	// 게시판 메인 페이지
	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(required = false, defaultValue= "1") int pageNum, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		PageInfo<BoardDto> datas = new PageInfo<>(boardService.selectBoardList(pageNum), 5);
		mv.addObject("data", datas);

		return mv;
	}
	
	//게시판 검색
	@RequestMapping(value = "/board/boardList", method = RequestMethod.POST)
	public Object boardSearch(
			@RequestParam(required = false, defaultValue= "1") int pageNum, 
			@RequestParam("search") String select, 
			@RequestParam("sarchSelect") int sarchSelect
			) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		
		// 아이디 검색
		if (sarchSelect == 1) {
			PageInfo<BoardDto> boardDto = new PageInfo<>(boardService.searchBoardList(pageNum, select), 5);
			mv.addObject("data", boardDto);
		}
		// 내용 검색
		if (sarchSelect == 2) {
			PageInfo<BoardDto> boardDtoContents = new PageInfo<>(boardService.searchBoardListContents(pageNum, select), 5);
			mv.addObject("data", boardDtoContents);
		}
		
		return mv;
	}
	
	// 게시판 상세 보기
	@RequestMapping(value = "/board/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("idx") int idx, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		BoardDto boardDto = boardService.boardDetail(idx);
		ModelAndView mv = new ModelAndView();
		String clickUserId = (String) session.getAttribute("userId");
		String enterUserId = boardDto.getUserId();
		
		if (clickUserId.equals(enterUserId)) {
			mv.setViewName("/board/boardDetail");
			mv.addObject("data", boardDto);
		}
		else {
			mv.setViewName("/board/boardDetailFail");
		}
			
		return mv;
	}
		
	// 게시판 상세 수정
	@RequestMapping(value = "/board/boardDetail", method = RequestMethod.PUT)
	public String boardDetailEdit(BoardDto boardDto) throws Exception {
		boardService.updateBoard(boardDto);

		return "redirect:/board/boardList";
	}
	
	// 게시판 상세 삭제
	@RequestMapping(value = "/board/boardDetail/{idx}", method = RequestMethod.DELETE)
	public String boardDetailDel(@PathVariable("idx") int idx) throws Exception {
		boardService.deleteBoard(idx);

		return "redirect:/board/boardList";
	}
	
	// 게시판 글쓰기 페이지 이동
	@RequestMapping(value = "/board/boardWrite", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		return "/board/boardWrite";
	}
	
	// 게시판 글쓰기
	@RequestMapping(value="/board/boardWrite", method=RequestMethod.POST)
	public String boardInsert(BoardDto boardDto) throws Exception {
		boardService.insertBoard(boardDto);

		return "redirect:/board/boardList";
	}
}
