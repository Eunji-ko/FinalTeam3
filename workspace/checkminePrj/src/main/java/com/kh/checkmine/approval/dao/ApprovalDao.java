package com.kh.checkmine.approval.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface ApprovalDao {

	//현재 사원의 결재대기문서 전체 조회
	int selectCountApAll(SqlSessionTemplate sst, String employeeNo);

}
