package com.kh.checkmine.board.vo;

import lombok.Data;

@Data
public class BoardVo {
	private String no;
	private String writer;
	private String title;
	private String content;
	private String hit;
	private String enrollDate;
	private String modifyDate;
	private String deleteYn;
	private String type;
	
	//추천수
	private String recommendCnt;

}
