package com.kh.checkmine.approval.service;

import java.util.List;

import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

public interface ApprovalService {

	//사원번호로 결재대기리스트 개수조회
	int selectTotalCnt(String employeeNo);

	//사원번호로 결재리스트 조회하기
	List<ApprovalDocVo> selectList(String employeeNo, PageVo pv);

	//문서번호로 결재문서 조회하기
	ApprovalDocVo selectDocByNo(String dno);

	//문서번호로 결재정보 조회해오기
	ApprovalVo selectApByDocNo(String dno);

	//문서번호로 기안서 조회하기
	ApprovalDraftVo selectDraftByNo(String dno);

	//사원번호로 작성자검색
	MemberVo selectEmpByNo(String writerNo);


}
