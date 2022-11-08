package com.kh.checkmine.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.alarm.dao.AlarmDao;
import com.kh.checkmine.alarm.vo.AlarmVo;
import com.kh.checkmine.approval.dao.ApprovalDao;
import com.kh.checkmine.mail.dao.MailDao;

@Service
@Transactional
public class AlarmServiceImpl implements AlarmService{
	
	private final AlarmDao dao;
	private final SqlSessionTemplate sst;
	private final ApprovalDao appDao;
	private final MailDao mailDao;

	@Autowired
	public AlarmServiceImpl(AlarmDao dao, SqlSessionTemplate sst, ApprovalDao appDao, MailDao mailDao) {
		super();
		this.dao = dao;
		this.sst = sst;
		this.appDao = appDao;
		this.mailDao = mailDao;
	}
	
	//알람 리스트 조회하기
	@Override
	public List<AlarmVo> selectAlarmListByNo(String no) {
		return dao.selectAlarmList(sst, no);
	}

	//알림 집어넣는 작업
	@Override
	public int insertTotalAlarm(String empNo) {
		
		//결재 건수 알림 집어넣기
		int insertApp = 0;
		int appSum = appDao.selectCountApAll(sst, empNo);
		if(appSum > 0) {
			Map<String, Object> appMap = new HashMap<String, Object>();
			appMap.put("empNo", empNo);
			appMap.put("appSum", appSum);
			insertApp = dao.insertApprovalAlarm(sst, appMap);
		}
		
		//메일 건수 알림 집어넣기
		int insertMail = 0;
		//안읽은 그냥메일 맵작업
		HashMap<String, String> mailCountMap1 = new HashMap<String, String>();
		mailCountMap1.put("memberNo", empNo);
		mailCountMap1.put("type", "A");
		//안읽은 참조메일 맵작업
		HashMap<String, String> mailCountMap2 = new HashMap<String, String>();
		mailCountMap2.put("memberNo", empNo);
		mailCountMap2.put("type", "R");
		int mailSum = mailDao.getNotReadCount(sst, mailCountMap1) + mailDao.getNotReadCount(sst, mailCountMap2);
		if(mailSum > 0) {
			Map<String, Object> mailMap = new HashMap<String, Object>();
			mailMap.put("empNo", empNo);
			mailMap.put("mailSum", mailSum);
			insertMail = dao.insertMailAlarm(sst, mailMap);
		}
		
		//업무 건수 알림 집어넣기
		int insertTask = 0;
		int taskSum = dao.selectTask(sst, empNo);
		if(taskSum > 0) {
			Map<String, Object> taskMap = new HashMap<String, Object>();
			taskMap.put("empNo", empNo);
			taskMap.put("taskSum", taskSum);
			insertTask = dao.insertTaskAlarm(sst, taskMap);
		}
		
		//공지사항 건수 알림 집어넣기 >> 따로 작업
		
		//일정 건수 알림 집어넣기
		int insertSchedule = 0;
		int scheduleSum = dao.selectSchedule(sst, empNo);
		if(scheduleSum > 0) {
			Map<String, Object> scheduleMap = new HashMap<String, Object>();
			scheduleMap.put("empNo", empNo);
			scheduleMap.put("scheduleSum", scheduleSum);
			insertSchedule = dao.insertScheduleAlarm(sst, scheduleMap);
		}
		
		//예약 건수 알림 집어넣기
		int insertReservation = 0;
		int reservationSum = dao.selectReservation(sst, empNo);
		if(reservationSum > 0) {
			Map<String, Object> reservationMap = new HashMap<String, Object>();
			reservationMap.put("empNo", empNo);
			reservationMap.put("reservationSum", reservationSum);
			insertSchedule = dao.insertReservationAlarm(sst, reservationMap);
		}
		
		if(insertApp+insertMail+insertTask+insertSchedule+insertReservation > 0) {			
			return 1;
		}else {
			return 0;
		}
	}

	//알림 삭제
	@Override
	public int deleteAlarmOne(String no) {
		return dao.deleteAlarm(sst, no);
	}

	//알림 읽음처리
	@Override
	public int readAlarmOne(String no) {
		return dao.updateAlarm(sst, no);
	}

	//확인할 공지 건수 알림에 넣기
	/*
	 * 공지사항 갯수 세기
	 * 이전에 읽은 공지사항 갯수(알림 테이블에서 공지사항 갯수 조회) + 입사일 이전에 나온 삭제된 공지 - 전체 공지사항 갯수(공지사항 테이블에서 삭제된 공지 포함 조회)
	 * >>다르면 insert
	 */
	@Override
	public int insertNoticeAlarm(String no) {
		
		//삭제된 공지 포함 모든 공지 조회
		int noticeAll = dao.selectNoticeAll(sst);
		
		//입사일 이전에 나온 삭제된 공지
		int noticeBefore = dao.selectNoticeBefore(sst, no);
		
		//알림을 통해 읽은 공지사항 갯수
		int readNotice = dao.selectReadNotice(sst, no);
		
		if(noticeAll > (noticeBefore+readNotice)) {
			int noticeSum = noticeAll-(noticeBefore+readNotice);
			Map<String, Object> noticeMap = new HashMap<String, Object>();
			noticeMap.put("empNo", no);
			noticeMap.put("noticeSum", noticeSum);
			return dao.insertNoticeAlarm(sst, noticeMap);
		}else {
			return 0;
		}
	}

	@Override
	public int readAlarmAll(String no) {
		return dao.updateAlarmAll(sst, no);
	}

}//class
