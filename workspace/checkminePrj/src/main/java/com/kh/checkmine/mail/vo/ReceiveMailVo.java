package com.kh.checkmine.mail.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ReceiveMailVo {
	public String no;
	public String mailNo;
	public String receiver;
	public String type;
	public String read;
	public String status;
	public String importance;
	public String sender;
	public String title;
	public String content;
	public String sStatus;
	public String sendDate;
	public String senderEmail;
	private List<MailAttVo> mailAttVo;
}
