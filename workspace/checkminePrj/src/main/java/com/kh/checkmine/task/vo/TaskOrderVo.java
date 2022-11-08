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
	private String startTime;
	private String endTime;
	private String importance;
	
	private String attName; //수신
	private String rattName;//참조
	
	private String posName; //작성자 직위
	
}
