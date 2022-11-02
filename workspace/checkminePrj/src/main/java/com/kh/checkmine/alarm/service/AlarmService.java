package com.kh.checkmine.alarm.service;

import java.util.List;

import com.kh.checkmine.alarm.vo.AlarmVo;

public interface AlarmService {

	//사원 번호로 알람 리스트 받아오기
	List<AlarmVo> selectAlarmListByNo(String no);
	
	//알람 테이블에 알람 알려줄거 넣어주기
	int insertTotalAlarm(String empNo);

	//알람 삭제
	int deleteAlarmOne(String no);

}
