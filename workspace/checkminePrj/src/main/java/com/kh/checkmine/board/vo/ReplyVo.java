package com.kh.checkmine.board.vo;

import lombok.Data;

@Data
public class ReplyVo {
	
	private String no;
	private String bNo;
	private String replier;
	private String content;
	private String replyDate;
	private String deleteYn;

	//직급
	private String position;
	
	//작성자의 번호
	private String mno;
}
