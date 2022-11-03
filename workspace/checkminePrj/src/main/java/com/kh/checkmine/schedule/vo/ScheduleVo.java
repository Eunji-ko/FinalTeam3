package com.kh.checkmine.schedule.vo;

import lombok.Data;

@Data
public class ScheduleVo {
	private String no;
	private String empNo;
	private String title;
	private String content;
	private String enorllDate;
	private String startDate;
	private String endDate;
	private String del;
	
	private String startTime;
	private String endTime;
}
