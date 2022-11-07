package com.kh.checkmine.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.service.ReplyService;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.member.vo.MemberVo;

/*
 * 게시판 > 댓글
*/
@Controller
@RequestMapping("reply")
public class ReplyController {
	
	private final ReplyService service;

	@Autowired
	public ReplyController(ReplyService service) {
		this.service = service;
	}
	
	//댓글 조회
	@PostMapping(value = "list/{no}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String list(@PathVariable String no) {
		
		Gson g = new Gson();
		List<ReplyVo> replyList = service.selectReplyList(no);
		String str = g.toJson(replyList);
		return str;
	}

	//댓글 작성
	@PostMapping("write")
	@ResponseBody
	public String reply(ReplyVo replyVo, HttpSession session) {
		//관리자 로그인 상태가 아니라면 일반 사용자의 로그인 정보 가져오기
		if(session.getAttribute("loginAdmin") != null) {
			AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
			replyVo.setReplier(loginAdmin.getNo());
		}else {
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			replyVo.setReplier(loginMember.getNo());
		}
		
		int result = service.reply(replyVo);
		
		if(result == 1) {
			return "ok";
		}else {
			return "fail";
		}
		
	}
	
	//댓글 삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(ReplyVo replyVo, HttpSession session) {
		int result = service.replyDelete(replyVo);
		
		if(result == 1) {
			return "ok";
		}else {
			return "fail";
		}
		
	}
		

}
