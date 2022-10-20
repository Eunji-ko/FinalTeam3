package com.kh.checkmine.task.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderDao {

	//���ü� �ۼ�
	int insertReport(SqlSessionTemplate sst, TaskOrderVo vo);

	//����,���� ���
	int insertReportAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo);

}
