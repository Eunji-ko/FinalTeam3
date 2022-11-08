package com.kh.checkmine.task.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskReportAttVo;
import com.kh.checkmine.task.vo.TaskReportFileVo;
import com.kh.checkmine.task.vo.TaskReportVo;

public interface TaskReportService {

	//보고서 작성
		//파일 O
	int write(TaskReportVo reportVo, List<TaskReportAttVo> attVoList, List<TaskReportFileVo> fileVoList);
		//파일 X
	int write(TaskReportVo reportVo, List<TaskReportAttVo> attVoList);
	
	// 수신참조용 멤버 목록 받아오기
	List<MemberVo> selectMemberList();

	
	//보고서 작성 화면 - 수신 리스트
	List<MemberVo> selectWriteAttList();
	
	//전체 조회
	int selectTotalCnt();
	
	//보고서 목록 조회
	List<TaskReportVo> selectList(PageVo pv);
	
	//보고서 상세 조회
	TaskReportVo selectOneByNo(String no);
		//수신
	TaskReportAttVo selectAttOne(String no);
		//참조
	TaskReportAttVo selectAttROne(String no);
		//파일 리스트
	List<TaskReportFileVo> selectFileForReportNo(String no);
		//파일 다운로드
	List<TaskReportFileVo> selectFileForNo(String fno);
	
	//검색
	int selectKeywordCnt(Map<String, String> map);
	List<TaskReportVo> selectReportKeyword(PageVo pv, Map<String, String> map);

	//수정
	int edit(TaskReportVo reportVo, List<TaskReportAttVo> attVoList, List<TaskReportFileVo> fileVoList);
	int edit(TaskReportVo reportVo, List<TaskReportAttVo> attVoList);
	
	//수정 수신참조
	TaskReportAttVo selectEditAtt(String no);
	TaskReportAttVo selectEditRatt(String no);
	
	//삭제
	int delete(String no);
	


}
