package com.kh.checkmine.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.schedule.service.ScheduleService;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	//업무 리스트
	@Override
	public List<TaskOrderVo> selcetOrderList(SqlSessionTemplate sst) {
		return sst.selectList("scheduleMapper.selcetOrderList");
	}

	//일정 리스트
	@Override
	public List<ScheduleVo> selectScheduleList(SqlSessionTemplate sst) {
		return sst.selectList("scheduleMapper.selectScheduleList");
	}

	//일정 등록
	@Override
	public int insertSchedule(SqlSessionTemplate sst, ScheduleVo vo) {
		return sst.insert("scheduleMapper.insertSchedule", vo);
	}

	//일정 삭제
	@Override
	public int updateSchedule(SqlSessionTemplate sst, String no) {
		return sst.update("scheduleMapper.updateSchedule", no);
	}

}
