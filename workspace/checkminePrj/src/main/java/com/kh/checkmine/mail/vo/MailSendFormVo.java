package com.kh.checkmine.mail.vo;

import java.util.List;

import lombok.Data;

@Data
public class MailSendFormVo {
	private String no;
	private String empNo;
	private String title;
	private String receiver;
	private String refer;
	private String content;
	private String[] receiverArr;
	private String[] referArr;
	private String currentMailNum;
	private List<MailAttVo> mailAttVoList;
}
