package com.kh.checkmine.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.mail.service.MailBinService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailBinVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailBinController {
	private final MailService mailService;
	private final MailBinService service;
	
	@Autowired
	public MailBinController(MailService mailService, MailBinService service) {
		this.mailService = mailService;
		this.service = service;
	}
	
	/**
	 * 휴지통 화면 보여주기
	 * @param pageNo
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("mail/bin")
	public String mailBin(@RequestParam(name = "p", defaultValue = "1")String pageNo, HttpSession session, Model model) {
		
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        
        //페이지 vo 만들기
        int listCount = service.getListCount(memberNo);
        
        PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(pageNo), 1, 15);
        model.addAttribute("pageVo", pageVo);
        
        //리스트 가져오기
        ArrayList<MailBinVo> mailBinList = (ArrayList<MailBinVo>) service.getList(memberNo, pageVo);
        
        model.addAttribute("mailBinList", mailBinList);
		
		return "mail/mail_bin";
	}
}
