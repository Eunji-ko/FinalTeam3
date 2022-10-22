package com.kh.checkmine.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceveMailVo;

@Controller
@RequestMapping("mail")
public class MailController {
	
	private final MailService service;
	
	@Autowired
	public MailController(MailService mailService) {
		this.service = mailService;
	}
	
	@GetMapping
	public String mail() {
		return "mail/mail_main";
	}
	
	@GetMapping("detail")
	public String mailDetail() {
		return "mail/mail_detail";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		return "mail/mail_write";
	}
	
	@GetMapping("addr")
	public String mailAddr() {
		return "mail/mail_addr";
	}
	
	/**
	 * 메일 리스트 가져오기
	 * @param type 편지함의 타입(받은편지, 중요편지...)
	 * @param page 현재 페이지
	 * @param loginMember 로그인한 사람 번호
	 * @param response 
	 * @return
	 */
	@PostMapping(value="getlist", produces = "application/text; charset=UTF-8" )
	@ResponseBody
	public String getList(String type, String page, String loginMember) {
		
		PageVo pageVo;
		Gson gson = new Gson();
		String listStr ="";
		
		if("receve".equals(type)||"ref".equals(type)) { //받은메일함일 때
			//페이지vo 생성
			int listCount = service.getListCount(type, loginMember);
			pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
			
			//데이터 뭉치기
			if("receve".equals(type)) {type = "A";}
			else if("ref".equals(type)) {type = "R";}
			
			HashMap<String , String> listInfo = new HashMap<String, String>();
			
			listInfo.put("type", type);
			listInfo.put("loginMember", loginMember);
			
			ArrayList<ReceveMailVo> rcvMailList = (ArrayList<ReceveMailVo>) service.getList(listInfo, pageVo);
			
			listStr = gson.toJson(rcvMailList);
			
		}else if("send".equals(type)) { //보낸메일함일 때//
			int listCount = service.getSendListCount(loginMember);
			pageVo = Pagination.getPageVo(listCount, Integer.parseInt(page), 1, 15);
			
			ArrayList<MailVo> sendMailList = (ArrayList<MailVo>) service.getSendList(loginMember, pageVo);
			
			listStr = gson.toJson(sendMailList);
		}
		
		return listStr;
	}
	
	
	
}
