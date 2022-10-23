package com.kh.checkmine.approval.service;

import java.util.List;

import com.kh.checkmine.approval.vo.ApprovalBuyOrderVo;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalExpenditureVo;
import com.kh.checkmine.approval.vo.ApprovalFileVo;
import com.kh.checkmine.approval.vo.ApprovalLeaveVo;
import com.kh.checkmine.approval.vo.ApprovalMinutesVo;
import com.kh.checkmine.approval.vo.ApprovalProposalVo;
import com.kh.checkmine.approval.vo.ApprovalStateVo;
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

	//문서번호로 제안서 조회하기
	ApprovalProposalVo selectProposalByNo(String dno);

	//문서번호로 회의록 조회하기
	ApprovalMinutesVo selectMinutesByNo(String dno);

	//문서번호로 지출결의서 조회하기
	ApprovalExpenditureVo selectExpenditureByNo(String dno);

	//문서번호로 구매품의서 조회하기
	ApprovalBuyOrderVo selectBuyOrderByNo(String dno);

	//문서번호로 전표 조회하기
	ApprovalStateVo selectStateByNo(String dno);

	//문서번호로 휴가 조회하기
	ApprovalLeaveVo selectLeaveByNo(String dno);

	//사원 이름으로 사원 검색
	List<MemberVo> selectEmpByName(String approver);

	//반려사유 업데이트
	int updateApReturn(ApprovalVo apVo);

	//최종 결재 후 결재정보 업데이트
	int updateApStatus(ApprovalVo apVo);

	//1차 결재일 업데이트
	int updateApDate1();

	//2차 결재일 업데이트
	int updateApDate2();

	//3차 결재일 업데이트
	int updateApDate3();

	//문서 정보 DB에 올리기
	int insertApDoc(ApprovalDocVo docVo);

	//결재 정보 DB에 올리기
	int insertApproval(ApprovalVo apVo);

	//기안서 정보 DB에 올리기
	int insertDraft(ApprovalDraftVo draftVo);

	//파일 정보 DB에 올리기
	int insertFile(ApprovalFileVo fileVo);


}
