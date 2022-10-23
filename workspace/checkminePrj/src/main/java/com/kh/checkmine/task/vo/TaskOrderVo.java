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
	
	//task-att 연결 / 해보고 문제 생기면 삭제
	private String attName;
	private String rattName;
	
	//작성자 데이터
	private String depName;
	private String posName;
	
}
