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

}
