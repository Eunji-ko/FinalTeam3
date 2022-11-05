package com.kh.checkmine.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.mail.service.MailAddrService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailAddrVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailAddrController {

	private final MailService mailService;
	private final MailAddrService service;
	
	@Autowired
	public MailAddrController(MailService mailService, MailAddrService service) {
		this.mailService = mailService;
		this.service = service;
	}
	
	/**
	 * 주소록 화면 보여주기
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("mail/addr")
	public String addr(HttpSession session, Model model) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
		int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
		
		model.addAttribute("notReadCountReceive", notReadCountReceive);
		model.addAttribute("notReadCountRef", notReadCountRef);
		
		
		//사내 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListInner = (ArrayList<MailAddrVo>) service.getAddrListInner(memberNo);
		//사외 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListOuter = (ArrayList<MailAddrVo>) service.getAddrListOuter(memberNo);
		//거래처 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListAcc = (ArrayList<MailAddrVo>) service.getAddrListAcc(memberNo);
		
		
		//각각 리스트 모델에 담기
		model.addAttribute("AddrListInner", AddrListInner);
		model.addAttribute("AddrListOuter", AddrListOuter);
		model.addAttribute("AddrListAcc", AddrListAcc);
		
		return "mail/mail_addr";
	}
	
	/**
	 * 주소록에 추가
	 * @param mailAddrVo
	 * @param session
	 * @return
	 */
	@PostMapping("mail/addr/insert")
	@ResponseBody
	public String addrInsert(MailAddrVo mailAddrVo, HttpSession session) {
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		mailAddrVo.setEmpNo(memberNo);
		
		int result = service.insertAddr(mailAddrVo);
		
		if(result == 1) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
	/**
	 * 주소록 삭제
	 * @param targetNo
	 * @return
	 */
	@PostMapping("mail/addr/delete")
	@ResponseBody
	public String addrDelete(String targetNo) {
		int result = service.deleteAddr(targetNo);
		
		return Integer.toString(result);
	}
}
