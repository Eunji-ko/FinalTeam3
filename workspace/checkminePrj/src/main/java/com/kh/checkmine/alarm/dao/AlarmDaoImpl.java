package com.kh.checkmine.alarm.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.alarm.vo.AlarmVo;

@Repository
public class AlarmDaoImpl implements AlarmDao{

	//알람 리스트 전체 조회하기
	@Override
	public List<AlarmVo> selectAlarmList(SqlSessionTemplate sst, String no) {
		return sst.selectList("alarmMapper.selectAlarmList", no);
	}

	//결재 건수 알림 테이블에 집어넣기
	@Override
	public int insertApprovalAlarm(SqlSessionTemplate sst, Map<String, Object> appMap) {
		return sst.insert("alarmMapper.insertApproval", appMap);
	}

	//알람 삭제
	@Override
	public int deleteAlarm(SqlSessionTemplate sst, String no) {
		return sst.delete("alarmMapper.deleteAlarm", no);
	}

	//메일 건수 알림 테이블에 집어넣기
	@Override
	public int insertMailAlarm(SqlSessionTemplate sst, Map<String, Object> mailMap) {
		return sst.insert("alarmMapper.insertMail", mailMap);
	}

	//알림 읽음처리
	@Override
	public int updateAlarm(SqlSessionTemplate sst, String no) {
		return sst.update("alarmMapper.updateAlarm", no);
	}

	//업무 건수 조회하기
	@Override
	public int selectTask(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("alarmMapper.selectTask", empNo);
	}

	//업무 건수 알림 테이블에 집어넣기
	@Override
	public int insertTaskAlarm(SqlSessionTemplate sst, Map<String, Object> taskMap) {
		return sst.insert("alarmMapper.insertTask", taskMap);
	}

	//여태까지 읽은 공지수 조회
	@Override
	public int selectReadNotice(SqlSessionTemplate sst, String no) {
		if(sst.selectOne("alarmMapper.selectReadNotice", no) == null) {
			return 0;
		}
		return sst.selectOne("alarmMapper.selectReadNotice", no);
	}

	//입사일 이전에 삭제된 공지수 조회
	@Override
	public int selectNoticeBefore(SqlSessionTemplate sst, String no) {
		return sst.selectOne("alarmMapper.selectNoticeBefore", no);
	}

	//삭제된 공지 포함 모든 공지 조회
	@Override
	public int selectNoticeAll(SqlSessionTemplate sst) {
		return sst.selectOne("alarmMapper.selectNoticeAll");
	}

	//공지사항 알림 집어넣기
	@Override
	public int insertNoticeAlarm(SqlSessionTemplate sst, Map<String, Object> noticeMap) {
		return sst.insert("alarmMapper.insertNoticeAlarm", noticeMap);
	}

	//일정 건수 알림 테이블에 집어넣기
	@Override
	public int insertScheduleAlarm(SqlSessionTemplate sst, Map<String, Object> scheduleMap) {
		return sst.insert("alarmMapper.insertScheduleAlarm", scheduleMap);
	}

	//일정 건수 조회하기
	@Override
	public int selectSchedule(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("alarmMapper.selectSchedule", empNo);
	}

	//예약 건수 조회하기
	@Override
	public int selectReservation(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("alarmMapper.selectReservation", empNo);
	}

	//예약 건수 알림 테이블에 집어넣기
	@Override
	public int insertReservationAlarm(SqlSessionTemplate sst, Map<String, Object> reservationMap) {
		return sst.insert("alarmMapper.insertReservation", reservationMap);
	}


}
