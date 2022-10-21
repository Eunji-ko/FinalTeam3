package com.kh.checkmine.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.approval.dao.ApprovalDao;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.common.PageVo;

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

	//현재 사원의 결재대기문서 전체개수 조회
	@Override
	public int selectTotalCnt(String employeeNo) {
		return dao.selectCountApAll(sst, employeeNo);
	}

	//사원번호로 결재대기문서 리스트 조회
	@Override
	public List<ApprovalDocVo> selectList(String employeeNo, PageVo pv) {
		return dao.selectApListAll(sst, employeeNo, pv);
	}


}
