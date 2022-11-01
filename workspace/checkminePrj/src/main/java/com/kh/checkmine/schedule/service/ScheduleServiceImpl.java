package com.kh.checkmine.schedule.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.schedule.dao.ScheduleDao;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	private final ScheduleDao dao;
	private final SqlSessionTemplate sst;
	
	public ScheduleServiceImpl(ScheduleDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	@Override
	public List<TaskOrderVo> selcetOrderList() {
		return dao.selcetOrderList(sst);
	}

	@Override
	public List<ScheduleVo> selectScheduleList() {
		return dao.selectScheduleList(sst);
	}

}
