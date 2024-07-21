package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.service.A02_BoardService;
import com.web.finalProject.vo.Board;
import com.web.finalProject.vo.BoardSch;

@Controller
public class A02_BoardCtrl {
	@Autowired(required = false)
	private A02_BoardService service;
	
	// http://localhost:4040/board/boardList.do  => board 빼야함
	// http://localhost:4040/boardList02.do
	@RequestMapping("boardList02.do")
	public String boardList(@ModelAttribute("sch") BoardSch sch, Model d) { 
		// boardSch의 모델명을 변경할 때.. 사용 옵션 : ModelAttribute
		d.addAttribute("blist", service.getBoardList(sch));
		return "WEB-INF\\views\\a02_boardList2.jsp";
	}
	@RequestMapping("boardInsertFrm02.do")
	public String boardInsertFrm() {
		return "WEB-INF\\views\\a02_boardInsert.jsp";
	}
	
	@PostMapping("boardInsert02.do")
	public String boardInsert(Board ins, Model d) {
		d.addAttribute("msg", service.boardInsert(ins));
		return "WEB-INF\\views\\a02_boardInsert.jsp";
	}
	@GetMapping("boardDetail02.do")
	public String boardDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("board", service.detail(no));
		return "WEB-INF\\views\\a02_boardDetail.jsp";
	}

	@PostMapping("boardUpdate02.do")
	public String boardUpdate(Board upt, Model d) {
		d.addAttribute("msg", service.updateBoard(upt));
		d.addAttribute("board", service.detail(upt.getNo()));
		return "WEB-INF\\views\\a02_boardDetail.jsp";
	}
	// boardUpdate.do boardDelete.do
	@GetMapping("boardDelete.do")
	public String boardDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteBoard(no));
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\a02_boardDetail.jsp";
	}	
	
	
	
	
	
}
