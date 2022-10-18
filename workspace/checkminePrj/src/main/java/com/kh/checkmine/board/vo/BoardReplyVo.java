package com.kh.checkmine.board.vo;

import lombok.Data;

@Data
public class BoardReplyVo {
	
	private String no;
	private String bNo;
	private String replier;
	private String content;
	private String replyDate;
	private String deleteYn;

}
