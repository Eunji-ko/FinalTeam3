package com.kh.checkmine.task.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TaskReportFileVo {
	private String no;
	private String repNo;
	private String name;
	private String path;
	private MultipartFile[] files;
}
