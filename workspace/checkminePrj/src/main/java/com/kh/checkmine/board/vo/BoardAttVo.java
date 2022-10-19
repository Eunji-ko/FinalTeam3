package com.kh.checkmine.board.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardAttVo {
	
	private String no;
	private String bNo;
	private String name;
	private String filePath;
	private String enrollDate;
	private MultipartFile[] attach;

}
