package com.kh.checkmine.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.service.mailSearchService;
import com.kh.checkmine.mail.vo.MailSearchVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailSearchController {
	private final MailService mailService;
	private final mailSearchService service;
	
	@Autowired
	public MailSearchController(MailService mailService, mailSearchService service) {
		this.mailService = mailService;
		this.service = service;
	}
	
	/**
	 * 메일 검색 결과 보여주기
	 * @param keyword
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("mail/search")
	public String mailSearch(@RequestParam(name = "k", defaultValue = "") String keyword,@RequestParam(name = "p", defaultValue = "1") String page, HttpSession session, Model model) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        
        //페이지네이션
        int listCount = service.mailSearchCount(keyword, memberNo);
        PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
        model.addAttribute("pageVo", pageVo);
		
        //리스트 가져오기
        ArrayList<MailSearchVo> resList = (ArrayList<MailSearchVo>) service.selectSearchList(keyword, memberNo, pageVo);
        
        
        model.addAttribute("resList", resList);
        model.addAttribute("keyword", keyword);
		
		return "mail/mail_search";
	}
	
	/**
	 * 검색결과 휴지통으로 보내기
	 * @param receiveArr
	 * @param refArr
	 * @param sendArr
	 * @return
	 */
	@PostMapping(value = "mail/search/delete", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mailSerchDelete(String[] receiveArr, String[] refArr, String[] sendArr) {
		if(receiveArr == null) {
			receiveArr = new String[0];
		}
		if(refArr == null) {
			refArr = new String[0];
		}
		if(sendArr == null) {
			sendArr = new String[0];
		}
//		
//		System.out.println(Arrays.toString(receiveArr));
//		System.out.println(Arrays.toString(refArr));
//		System.out.println(Arrays.toString(sendArr));
		
		int result = 1;
		result = result * mailService.moveRecycleBinReceive(receiveArr);
		result = result * mailService.moveRecycleBinReceive(refArr);
		result = result * mailService.moveRecycleBinSend(sendArr);
		
		return Integer.toString(receiveArr.length + refArr.length + sendArr.length);
	}
}
