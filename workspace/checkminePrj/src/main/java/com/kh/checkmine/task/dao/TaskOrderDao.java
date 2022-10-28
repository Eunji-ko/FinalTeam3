package com.kh.checkmine.task.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderDao {

	//지시서 작성
	int insertOrder(SqlSessionTemplate sst, TaskOrderVo vo);

	//수신, 참조 등록
	int insertOrderAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo);

	//파일 등록
	int insertFile(SqlSessionTemplate sst, TaskOrderFileVo taskOrderFileVo);

	//전체 게시글 조회
	int selectCountAll(SqlSessionTemplate sst);

	//게시글 목록 조회
	List<TaskOrderVo> selectList(SqlSessionTemplate sst, PageVo pv);


	//지시서 디테일
	TaskOrderVo selectOneByNo(SqlSessionTemplate sst, String no);

	//지시서 디테일 - 수신자 조회
	TaskOrderAttVo selectAttOne(SqlSessionTemplate sst, String no);
	TaskOrderAttVo selectAttROne(SqlSessionTemplate sst, String no);

	//지시서 작성 수신자
	List<MemberVo> selectWriteAttList(SqlSessionTemplate sst);

	//지시서 파일 목록 조회
	List<TaskOrderFileVo> selectFileList(SqlSessionTemplate sst, String no);

	//지시서 파일 다운로드
	List<TaskOrderFileVo> selectFile(SqlSessionTemplate sst, String pno);

	//보고서 작성할 때 지시서 연결
	List<TaskOrderVo> selectListForAtt(SqlSessionTemplate sst, String empNo);

	//게시글 검색 + 조회된 게시글 수
	int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map);

	//게시글 검색
	List<TaskOrderVo> selectOrderKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);


}
