package com.kh.checkmine.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface ScheduleDao {

	//업무 가져오기
	List<TaskOrderVo> selcetOrderList(SqlSessionTemplate sst);

	//일정 가져오기
	List<ScheduleVo> selectScheduleList(SqlSessionTemplate sst);

}
