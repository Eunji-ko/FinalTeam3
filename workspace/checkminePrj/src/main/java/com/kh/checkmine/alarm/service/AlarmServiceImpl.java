package com.kh.checkmine.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.alarm.dao.AlarmDao;
import com.kh.checkmine.alarm.vo.AlarmVo;
import com.kh.checkmine.approval.dao.ApprovalDao;
import com.kh.checkmine.mail.dao.MailDao;

@Service
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

	@Override
	public int insertTotalAlarm(String empNo) {
		
		//결재 건수 알람 집어넣기
		int insertApp = 0;
		int appSum = appDao.selectCountApAll(sst, empNo);
		if(appSum > 0) {
			Map<String, Object> appMap = new HashMap<String, Object>();
			appMap.put("empNo", empNo);
			appMap.put("appSum", appSum);
			insertApp = dao.insertApprovalAlarm(sst, appMap);
		}
		
		//메일 건수 알람 집어넣기
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
			mailMap.put("appSum", appSum);
			insertMail = dao.insertMailAlarm(sst, mailMap);
		}
		
		//
		
		if(insertApp+insertMail > 0) {			
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

}
