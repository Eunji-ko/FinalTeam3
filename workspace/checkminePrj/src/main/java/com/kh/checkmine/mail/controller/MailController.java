package com.kh.checkmine.mail.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
	@PostMapping("write")
	public String mailWrite(String test) {
		System.out.println(test);
		
		return"";
	}
	
	@GetMapping("addr")
	public String mailAddr() {
		return "mail/mail_addr";
	}
}
