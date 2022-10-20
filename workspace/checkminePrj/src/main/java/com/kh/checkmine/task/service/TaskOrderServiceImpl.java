package com.kh.checkmine.task.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.task.dao.TaskOrderDao;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Service
public class TaskOrderServiceImpl implements TaskOrderService {

	private final TaskOrderDao orderDao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public TaskOrderServiceImpl(TaskOrderDao orderDao, SqlSessionTemplate sst) {
		this.orderDao = orderDao;
		this.sst = sst;
	}

	//지시서 작성
	@Override
	public int write(TaskOrderVo vo) {
		

		System.out.println("서비스 ::: " + vo);
		
		return orderDao.insertReport(sst, vo);
	}

	//수신참조 등록
	@Override
	public int addAtt(TaskOrderAttVo orderAttVo) {
		return orderDao.insertReportAtt(sst, orderAttVo);
	}

}
