package com.kh.checkmine.approval.service;

import java.util.List;

import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.common.PageVo;

public interface ApprovalService {

	//사원번호로 결재대기리스트 개수조회
	int selectTotalCnt(String employeeNo);

	//사원번호로 결재리스트 조회하기
	List<ApprovalDocVo> selectList(String employeeNo, PageVo pv);


}
