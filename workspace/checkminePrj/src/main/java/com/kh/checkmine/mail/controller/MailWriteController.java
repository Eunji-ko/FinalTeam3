package com.kh.checkmine.mail.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.checkmine.mail.service.MailSendService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailWriteController {
	
	private final MailService mailService;
	private final MailSendService mailSendService;
	
	@Autowired
	public MailWriteController(MailService mailService, MailSendService mailSendService) {
		this.mailService = mailService;
		this.mailSendService = mailSendService;
	}
	
	/**
	 * 메일 쓰기 화면 보여주기
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("mail/write")
	public String mailWrite(HttpSession session, Model model) {
		
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		 //안읽은 메일 갯수 가져오기
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
		
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        return "mail/mail_write";
	}
	
	/**
	 * 메일 보내기
	 * @param formVo
	 * @return
	 */
	@PostMapping("mail/send")
	public String mailWriteSend(MailSendFormVo formVo,HttpSession session) {

		// 데이터 뭉치기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		formVo.setEmpNo(memberNo);

		formVo.setReceiverArr(formVo.getReceiver().split(","));
		formVo.setReferArr(formVo.getRefer().split(","));
		
		int mailResult = mailSendService.insertMail(formVo);
		
		//TODO 파일첨부
		if(mailResult == 1) {
			return "redirect:/mail/receive";
		}else{
			return "redirect:/mail/receive";
		}
	}
}
