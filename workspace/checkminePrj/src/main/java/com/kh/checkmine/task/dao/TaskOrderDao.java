package com.kh.checkmine.task.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderDao {

	//지시서 작성
	int insertReport(SqlSessionTemplate sst, TaskOrderVo vo);

	//수신,참조 등록
	int insertReportAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo);

}
