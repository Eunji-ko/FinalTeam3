package com.kh.checkmine.task.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderService {
	
	//지시서 작성
		// 파일 O	
	int write(TaskOrderVo orderVo, List<TaskOrderAttVo> attVoList, List<TaskOrderFileVo> fileVoList); 
		// 파일 X
	int write(TaskOrderVo orderVo, List<TaskOrderAttVo> attVoList);

	//전체 지시서 목록 조회
	int selectTotalCnt();
	
	//지시서 목록 조회
	List<TaskOrderVo> selectList(PageVo pv);
	
	//지시서 디테일
	TaskOrderVo selectOneByNo(String no);
	
	//지시서 디테일 - 수신자 조회
	TaskOrderAttVo selectAttOne(String no);
	TaskOrderAttVo selectAttROne(String no);
	
	//지시서 수신자 리스트
	List<MemberVo> selectWriteAttList();
	
	//지시서 파일 목록 조회
	List<TaskOrderFileVo> selectFileList(String no);
	
	//지시서 파일 다운로드
	List<TaskOrderFileVo> selectFile(String pno);
	
	//보고서 작성할 때 지시서 연결
	List<TaskOrderVo> selectListForAtt(String empNo);

	//지시서 검색 게시글 수
	int selectKeywordCnt(Map<String, String> map);
	
	//지시서 검색
	List<TaskOrderVo> selectTaskKeyword(PageVo pv, Map<String, String> map);
	
}
