package com.kh.checkmine.task.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Repository
public class TaskOrderDaoImpl implements TaskOrderDao {

	//���ü� �ۼ�
	@Override
	public int insertReport(SqlSessionTemplate sst, TaskOrderVo vo) {
		return sst.insert("taskOrderMapper.insertReport", vo);
	}

	//����, ���� ���
	@Override
	public int insertReportAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo) {
		return sst.insert("taskOrderMapper.insertReportAtt", orderAttVo);
	}

}
