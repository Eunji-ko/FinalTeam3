package com.kh.checkmine.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.common.PageVo;

public interface ApprovalDao {

	//현재 사원의 결재대기문서 전체개수 조회
	int selectCountApAll(SqlSessionTemplate sst, String employeeNo);

	//사원번호로 결재대기문서 전체 리스트 조회 
	List<ApprovalDocVo> selectApListAll(SqlSessionTemplate sst, String employeeNo, PageVo pv);

}
