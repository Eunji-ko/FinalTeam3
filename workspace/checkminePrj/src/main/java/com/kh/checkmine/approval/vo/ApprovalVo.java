package com.kh.checkmine.approval.vo;

import lombok.Data;

@Data
public class ApprovalVo {
	
	private String no;
	private String docNo;
	private String firstApprover;
	private String secondApprover;
	private String thirdApprover;
	private String finalApprover;
	private String firstDate;
	private String secondDate;
	private String thirdDate;
	private String finalDate;
	private String status;
	private String returnReason;

}
