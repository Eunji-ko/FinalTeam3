package com.kh.checkmine.mail.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("mail")
public class MailController {
	
	private final MailService service;
	
	@Autowired
	public MailController(MailService mailService) {
		this.service = mailService;
	}
	
	/**
	 * 받은 편지함 화면 보여주기
	 * @param session
	 * @param page
	 * @return
	 */
	@GetMapping("receive")
	public String receiveMail(HttpSession session, @RequestParam(value = "p", defaultValue = "1") String page, Model model) {
		
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		//pageVo생성
		int listCount = service.getReceiveListCount(memberNo);
        PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
        
        //리스트 불러오기
        ArrayList<ReceiveMailVo> receiveMailList = (ArrayList<ReceiveMailVo>) service.getReceiveList(memberNo, pageVo);
        
        //안읽은 메일 갯수 가져오기
        int notReadCountReceive = service.getNotReadCount(memberNo, "A");
        int notReadCountRef = service.getNotReadCount(memberNo, "R");
        
        model.addAttribute("receiveMailList", receiveMailList);
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        
		return "mail/mail_receive";
	}
	
	/**
	 * 참조 편지함 화면 보여주기
	 * @param session
	 * @param page
	 * @return
	 */
	@GetMapping("ref")
	public String refMail(HttpSession session, @RequestParam(value = "p", defaultValue = "1") String page, Model model) {
		
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		//pageVo생성
		int listCount = service.getRefListCount(memberNo);
        PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
        
        //리스트 불러오기
        ArrayList<ReceiveMailVo> refMailList = (ArrayList<ReceiveMailVo>) service.getRefList(memberNo, pageVo);
        
        //안읽은 메일 갯수 가져오기
        int notReadCountReceive = service.getNotReadCount(memberNo, "A");
        int notReadCountRef = service.getNotReadCount(memberNo, "R");
        
        model.addAttribute("refMailList", refMailList);
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        
		return "mail/mail_ref";
	}
	
	/**
	 * 보낸메일함 화면 보여주기
	 * @param session
	 * @param page
	 * @param model
	 * @return
	 */
	@GetMapping("send")
	public String sendMail(HttpSession session, @RequestParam(value = "p", defaultValue = "1") String page, Model model) {
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		int listCount = service.getSendListCount(memberNo);
		PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
		
		ArrayList<MailVo> sendMailList = (ArrayList<MailVo>) service.getSendList(memberNo, pageVo);
		
		int notReadCountReceive = service.getNotReadCount(memberNo, "A");
        int notReadCountRef = service.getNotReadCount(memberNo, "R");

        model.addAttribute("sendMailList", sendMailList);
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		return "mail/mail_send";
	}
	
	/**
	 * 중요 편지함 화면 보여주기
	 * @param session
	 * @param page
	 * @return
	 */
	@GetMapping("imp")
	public String impMail(HttpSession session, @RequestParam(value = "p", defaultValue = "1") String page, Model model) {
		
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		//pageVo생성
		int listCount = service.getImpListCount(memberNo);
        PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
        
        //리스트 불러오기
        ArrayList<ReceiveMailVo> ImpMailList = (ArrayList<ReceiveMailVo>) service.getImpList(memberNo, pageVo);
        
        //안읽은 메일 갯수 가져오기
        int notReadCountReceive = service.getNotReadCount(memberNo, "A");
        int notReadCountRef = service.getNotReadCount(memberNo, "R");
        
        model.addAttribute("ImpMailList", ImpMailList);
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        
		return "mail/mail_imp";
	}
	

	/**
	 * 임시저장 메일함 화면 보여주기
	 * @param session
	 * @param page
	 * @param model
	 * @return
	 */
	@GetMapping("save")
	public String saveMail(HttpSession session, @RequestParam(value = "p", defaultValue = "1") String page, Model model) {
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		
		int listCount = service.getSaveListCount(memberNo);
		PageVo pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
		
		ArrayList<MailSendFormVo> saveMailList = (ArrayList<MailSendFormVo>) service.getSaveList(memberNo, pageVo);
		
		int notReadCountReceive = service.getNotReadCount(memberNo, "A");
        int notReadCountRef = service.getNotReadCount(memberNo, "R");

        model.addAttribute("saveMailList", saveMailList);
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		return "mail/mail_save";
	}
	
	/**
	 * 중요도 표시 토글
	 * @param mailNum
	 * @param importance
	 * @return
	 */
	@PostMapping("importance")
	@ResponseBody
	public String setImportance(String mailNum, String importance) {
		HashMap<String, String> impVo = new HashMap<String, String>();
		impVo.put("mailNum", mailNum);
		impVo.put("importance", importance);
		
		int result = service.setImportance(impVo);
		
		return Integer.toString(result);
	}
	
	/**
	 * 받은메일함 휴지통으로 보내기
	 * @param targetMails
	 * @return
	 */
	@PostMapping("moveRecycleBinReceive")
	@ResponseBody
	public String moveRecycleBin(String[] targetMails) {
		int result = service.moveRecycleBinReceive(targetMails);
		
		if(result == 1) {
			return Integer.toString(targetMails.length);
		}else {
			return "[실패]0";
		}
	}
	
	/**
	 * 보낸메일함 휴지통 보내기
	 * @param targetMails
	 * @return
	 */
	@PostMapping("moveRecycleBinSend")
	@ResponseBody
	public String moveRecycleBinSend(String[] targetMails) {
		
		System.out.println(Arrays.toString(targetMails));
		
		int result = service.moveRecycleBinSend(targetMails);
		
		System.out.println(result);
		
		if(result == 1) {
			return Integer.toString(targetMails.length);
		}else {
			return "[실패]0";
		}
	}
	
	@PostMapping("moveRecycleBinSave")
	@ResponseBody
	public String moveRecycleBinSave(String[] targetMails) {
		
		System.out.println(Arrays.toString(targetMails));
		
		int result = service.moveRecycleBinSave(targetMails);
		
		System.out.println(result);
		
		if(result == 1) {
			return Integer.toString(targetMails.length);
		}else {
			return "[실패]0";
		}
	}
}
