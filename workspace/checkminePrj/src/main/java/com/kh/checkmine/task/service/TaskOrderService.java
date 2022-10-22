package com.kh.checkmine.task.service;

import java.util.List;

import com.kh.checkmine.common.PageVo;
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

}
