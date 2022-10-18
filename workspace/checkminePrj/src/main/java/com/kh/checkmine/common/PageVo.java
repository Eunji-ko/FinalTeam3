package com.kh.checkmine.common;

import lombok.Data;

@Data
public class PageVo {
	
	private int listCount; //총 게시글 수
	private int currentPage; // 현재 페이지 정보
	private int pageLimit; // 하단 페이지 영역 페이지 버튼 갯수
	private int boardLimit; // 한 페이지에서 보여줄 최대 게시글 갯수
	
	
	private int maxPage; //가장 마지막 페이지
	private int startPage; // 페이지 영역에서 시작 페이지
	private int endPage; // 페이지 영역에서 마지막 페이지

}
