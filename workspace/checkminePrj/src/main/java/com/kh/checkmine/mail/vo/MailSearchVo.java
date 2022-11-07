package com.kh.checkmine.mail.vo;

import lombok.Data;

@Data
public class MailSearchVo {
	private String no;
	private String sender;
	private String title;
	private String content;
	private String sendDate;
	private String type;
	private String read;
	private String importance;
}
