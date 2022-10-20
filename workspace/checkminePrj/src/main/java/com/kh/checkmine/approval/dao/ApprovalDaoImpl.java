package com.kh.checkmine.approval.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	//현재 사원의 결재대기문서 전체 조회
	@Override
	public int selectCountApAll(SqlSessionTemplate sst, String employeeNo) {
		return sst.selectOne("approvalMapper.selectCountApAll",employeeNo);
	}

}
