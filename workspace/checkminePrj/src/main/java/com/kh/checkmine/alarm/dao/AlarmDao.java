package com.kh.checkmine.alarm.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.alarm.vo.AlarmVo;

public interface AlarmDao {

	//알람 전체 리스트 조회해오기
	List<AlarmVo> selectAlarmList(SqlSessionTemplate sst, String no);

	//결재 건수 알람테이블에 집어넣기
	int insertApprovalAlarm(SqlSessionTemplate sst, Map<String, Object> appMap);

	//알람 삭제
	int deleteAlarm(SqlSessionTemplate sst, String no);

	//메일 건수 알림 테이블에 집어넣기
	int insertMailAlarm(SqlSessionTemplate sst, Map<String, Object> mailMap);

	//알림 읽음처리
	int updateAlarm(SqlSessionTemplate sst, String no);

	//업무 건수 조회하기
	int selectTask(SqlSessionTemplate sst, String empNo);

	//업무 건수 알림 테이블에 집어넣기
	int insertTaskAlarm(SqlSessionTemplate sst, Map<String, Object> taskMap);

	//여태까지 알림을 통해 읽은 공지수 조회하기
	int selectReadNotice(SqlSessionTemplate sst, String no);

	//입사일 이전에 뜬 공지 수 세기
	int selectNoticeBefore(SqlSessionTemplate sst, String no);

	//모든 공지수 조회하기
	int selectNoticeAll(SqlSessionTemplate sst);

	//알림으로 확인할 공지 갯수 집어넣기
	int insertNoticeAlarm(SqlSessionTemplate sst, Map<String, Object> noticeMap);

	//일정 건수 알림 테이블에 집어넣기
	int insertScheduleAlarm(SqlSessionTemplate sst, Map<String, Object> scheduleMap);

	//일정 건수 조회하기
	int selectSchedule(SqlSessionTemplate sst, String empNo);

	//예약 건수 조회하기
	int selectReservation(SqlSessionTemplate sst, String empNo);

	//예약 건수 알림 테이블에 집어넣기
	int insertReservationAlarm(SqlSessionTemplate sst, Map<String, Object> reservationMap);

	//모든 알림 읽기
	int updateAlarmAll(SqlSessionTemplate sst, String no);

}
