package com.kh.checkmine.task.vo;

import lombok.Data;

@Data
public class TaskOrderVo {
	private String no;
	private String orderer;
	private String deptNo;
	private String title;
	private String content;
	private String enrollDate;
	private String startDate;
	private String endDate;
	private String importance;
}
