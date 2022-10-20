package com.kh.checkmine.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.board.service.ReplyService;

@Controller
@RequestMapping("reply")
public class ReplyController {
	
	private final ReplyService rs;

	@Autowired
	public ReplyController(ReplyService rs) {
		this.rs = rs;
	}

}
