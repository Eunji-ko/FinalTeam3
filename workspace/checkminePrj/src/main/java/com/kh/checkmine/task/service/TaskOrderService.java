package com.kh.checkmine.task.service;

import java.util.List;

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
	
	//지시서 수신자 조회
	List<TaskOrderAttVo> selectAttList(TaskOrderAttVo attVo);
	
	//지시서 디테일
	TaskOrderVo selectOne(String no);
	
	//지시서 디테일 - 수신자 조회
	TaskOrderAttVo selectAttOne(String no);
	
	//지시서 수신자 리스트
	List<MemberVo> selectWriteAttList();
	
	//지시서 파일 다운로드
	List<TaskOrderFileVo> selectFileList(String no);
}
