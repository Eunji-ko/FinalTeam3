package com.kh.checkmine.alarm.service;

import java.util.List;

import com.kh.checkmine.alarm.vo.AlarmVo;

public interface AlarmService {

	//사원 번호로 알람 리스트 받아오기
	List<AlarmVo> selectAlarmListByNo(String no);
	
	//알림 테이블에 알림 알려줄거 넣어주기
	int insertTotalAlarm(String empNo);

	//알림 삭제
	int deleteAlarmOne(String no);

	//알림 읽음처리
	int readAlarmOne(String no);

}
