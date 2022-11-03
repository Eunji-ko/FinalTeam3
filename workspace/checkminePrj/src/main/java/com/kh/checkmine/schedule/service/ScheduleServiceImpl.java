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

	//지시서 가져오기
	@Override
	public List<TaskOrderVo> selcetOrderList() {
		return dao.selcetOrderList(sst);
	}

	//일정 가져오기
	@Override
	public List<ScheduleVo> selectScheduleList() {
		return dao.selectScheduleList(sst);
	}

	//일정 등록
	@Override
	public int insertSchedule(ScheduleVo vo) {
		return dao.insertSchedule(sst, vo);
	}

	//일정 삭제
	@Override
	public int updateSchedule(String no) {
		return dao.updateSchedule(sst, no);
	}

}
