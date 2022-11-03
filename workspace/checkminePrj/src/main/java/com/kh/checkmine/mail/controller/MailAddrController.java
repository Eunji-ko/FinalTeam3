package com.kh.checkmine.mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailAddrController {

	private final MailService mailService;
	
	@Autowired
	public MailAddrController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@GetMapping("mail/addr")
	public String addr(HttpSession session, Model model) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
		return "mail/mail_addr";
	}
}
