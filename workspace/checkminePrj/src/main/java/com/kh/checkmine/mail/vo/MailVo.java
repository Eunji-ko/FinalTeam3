package com.kh.checkmine.mail.vo;

import lombok.Data;

@Data
public class MailVo {
	private String no;
	private String sender;
	private String title;
	private String content;
	private String sStatus;
	private String sendDate;
}
