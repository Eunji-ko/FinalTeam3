package com.kh.checkmine.mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmine.mail.service.MailDetailService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.ReceiveMailVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailDetailController {
	
	private final MailDetailService service;
	private final MailService mailService;
	
	@Autowired
	public MailDetailController(MailDetailService service, MailService mailService) {
		this.mailService = mailService;
		this.service = service;
	}
	
	/**
	 * 받은메일 상세조회 화면
	 * @param mailNo
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("mail/receive/detail")
	public String mailReceiveDetail(@RequestParam(value = "n", defaultValue = "1") String mailNo, Model model, HttpSession session) {	
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
		//리스트 객체 가져오기
		ReceiveMailVo mailVo = service.getReceiveMailVo(mailNo);
		
		System.out.println(mailVo);
		model.addAttribute("mailVo", mailVo);
		return "mail/mail_detail_receive";
	}
}
