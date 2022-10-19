package com.kh.checkmine.mail.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("mail")
public class MailController {
	
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
	
	@PostMapping("recycleBin")
	@ResponseBody
	public String moveToRecycleBin(@RequestParam(value="mails[]")int[] mails) {
		//서비스로 보내기
		return "3";
	}
	
	@PostMapping("importance")
	@ResponseBody
	public void updateImp(String importance, String mailNum) {
		//서비스로 보내기
	}
}
