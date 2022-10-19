package com.kh.checkmine.approval.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApprovalFileVo {
	
	private String no;
	private String docNo;
	private MultipartFile fileName;
	private String fpath;

}
