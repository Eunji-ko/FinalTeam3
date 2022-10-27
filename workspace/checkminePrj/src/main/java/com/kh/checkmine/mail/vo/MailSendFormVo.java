package com.kh.checkmine.mail.vo;

import lombok.Data;

@Data
public class MailSendFormVo {
	private String empNo;
	private String title;
	private String receiver;
	private String refer;
	private String content;
	private String[] receiverArr;
	private String[] referArr;
}
