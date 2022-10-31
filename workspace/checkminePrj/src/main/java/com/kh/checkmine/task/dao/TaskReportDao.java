package com.kh.checkmine.task.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskReportAttVo;
import com.kh.checkmine.task.vo.TaskReportFileVo;
import com.kh.checkmine.task.vo.TaskReportVo;

public interface TaskReportDao {
	
	//지시서 작성 화면 - 수신 리스트
	List<MemberVo> selectWriteAttList(SqlSessionTemplate sst);
	
	//지시서 작성
	int insertReport(SqlSessionTemplate sst, TaskReportVo reportVo);

	//수신참조 등록
	int insertReportAtt(SqlSessionTemplate sst, TaskReportAttVo taskReportAttVo);

	//파일 등록
	int insertFile(SqlSessionTemplate sst, TaskReportFileVo taskReportFileVo);

	//전체글 카운트
	int selectCountAll(SqlSessionTemplate sst);

	//목록 조회
	List<TaskReportVo> selectList(SqlSessionTemplate sst, PageVo pv);

	//상세 보기
	TaskReportVo selectOneByNo(SqlSessionTemplate sst, String no);
		//수신
	TaskReportAttVo selectAttOne(SqlSessionTemplate sst, String no);
		//참조
	TaskReportAttVo selectAttROne(SqlSessionTemplate sst, String no);
		//파일 목록
	List<TaskReportFileVo> selectFileForReportNo(SqlSessionTemplate sst, String no);
		//파일 다운로드
	List<TaskReportFileVo> selectFileForNo(SqlSessionTemplate sst, String fno);

	//검색 기능
	int selectKeywordCnt(SqlSessionTemplate sst, Map<String, String> map);

	List<TaskReportVo> selectReportKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);



}
