package com.kh.checkmine.approval.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.approval.dao.ApprovalDao;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public ApprovalServiceImpl(ApprovalDao dao, SqlSessionTemplate sst) {
		super();
		this.dao = dao;
		this.sst = sst;
	}

	//현재 사원의 결재대기문서 전체 조회
	@Override
	public int selectTotalCnt(String employeeNo) {
		return dao.selectCountApAll(sst, employeeNo);
	}


}
