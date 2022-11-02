package com.kh.checkmine.mail.vo;

import java.util.List;

import lombok.Data;

@Data
public class MailVo {
	private String no;
	private String sender;
	private String title;
	private String content;
	private String sStatus;
	private String sendDate;
	private List<MailAttVo> mailAttVo;
	private String receiverListString;
	private String refersListString;
}
