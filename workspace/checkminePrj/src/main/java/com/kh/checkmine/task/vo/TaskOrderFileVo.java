package com.kh.checkmine.task.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TaskOrderFileVo {
	private String no;
	private String taskNo;
	private String name;
	private String path;
	private MultipartFile[] files;
}
