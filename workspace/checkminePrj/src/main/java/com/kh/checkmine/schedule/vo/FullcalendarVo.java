package com.kh.checkmine.schedule.vo;

import lombok.Data;

@Data
public class FullcalendarVo {
	private String id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
	private boolean allday;
	private String textColor;
	private String color;
	private String borderColor;
}
