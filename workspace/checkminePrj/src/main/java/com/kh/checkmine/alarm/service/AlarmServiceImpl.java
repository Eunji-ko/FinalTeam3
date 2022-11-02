package com.kh.checkmine.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.alarm.dao.AlarmDao;
import com.kh.checkmine.alarm.vo.AlarmVo;
import com.kh.checkmine.approval.dao.ApprovalDao;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	private final AlarmDao dao;
	private final SqlSessionTemplate sst;
	private final ApprovalDao appDao;

	public AlarmServiceImpl(AlarmDao dao, SqlSessionTemplate sst, ApprovalDao appDao) {
		super();
		this.dao = dao;
		this.sst = sst;
		this.appDao = appDao;
	}
	
	//알람 리스트 조회하기
	@Override
	public List<AlarmVo> selectAlarmListByNo(String no) {
		return dao.selectAlarmList(sst, no);
	}

	@Override
	public int insertTotalAlarm(String empNo) {
		
		//결재 건수 알람 집어넣기
		int appSum = appDao.selectCountApAll(sst, empNo);
		Map appMap = new HashMap();
		appMap.put("empNo", empNo);
		appMap.put("appSum", appSum);
		int insertApp = dao.insertApprovalAlarm(sst, appMap);
		
		if(insertApp == 1) {			
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int deleteAlarmOne(String no) {
		return dao.deleteAlarm(sst, no);
	}

}
