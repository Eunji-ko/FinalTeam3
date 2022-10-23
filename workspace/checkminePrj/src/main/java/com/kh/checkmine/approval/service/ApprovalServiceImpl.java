package com.kh.checkmine.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.approval.dao.ApprovalDao;
import com.kh.checkmine.approval.vo.ApprovalBuyOrderVo;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalExpenditureVo;
import com.kh.checkmine.approval.vo.ApprovalLeaveVo;
import com.kh.checkmine.approval.vo.ApprovalMinutesVo;
import com.kh.checkmine.approval.vo.ApprovalProposalVo;
import com.kh.checkmine.approval.vo.ApprovalStateVo;
import com.kh.checkmine.approval.vo.ApprovalVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

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

	//문서번호로 결재문서 조회하기
	@Override
	public ApprovalDocVo selectDocByNo(String dno) {
		return dao.selectDoc(sst, dno);
	}

	//문서번호로 결재정보 조회해오기
	@Override
	public ApprovalVo selectApByDocNo(String dno) {
		return dao.selectAp(sst, dno);
	}

	//문서번호로 기안서 조회하기
	@Override
	public ApprovalDraftVo selectDraftByNo(String dno) {
		return dao.selectDraft(sst, dno);
	}

	//사원번호로 작성자검색
	@Override
	public MemberVo selectEmpByNo(String writerNo) {
		return dao.selectWriter(sst, writerNo);
	}

	//문서번호로 제안서 조회하기
	@Override
	public ApprovalProposalVo selectProposalByNo(String dno) {
		return dao.selectProposal(sst, dno);
	}

	//문서번호로 회의록 조회하기
	@Override
	public ApprovalMinutesVo selectMinutesByNo(String dno) {
		return dao.selectMinutes(sst, dno);
	}

	//문서번호로 지출결의서 조회하기
	@Override
	public ApprovalExpenditureVo selectExpenditureByNo(String dno) {
		return dao.selectExpenditure(sst, dno);
	}

	//문서번호로 구매품의서 조회하기
	@Override
	public ApprovalBuyOrderVo selectBuyOrderByNo(String dno) {
		return dao.selectBuyOrder(sst, dno);
	}

	//문서번호로 전표 조회하기
	@Override
	public ApprovalStateVo selectStateByNo(String dno) {
		return dao.selectState(sst, dno);
	}

	//문서번호로 휴가 조회하기
	@Override
	public ApprovalLeaveVo selectLeaveByNo(String dno) {
		return dao.selectLeave(sst, dno);
	}

	//사원 이름으로 사원 검색하기
	@Override
	public List<MemberVo> selectEmpByName(String approver) {
		return dao.selectEmpList(sst, approver);
	}
	


}
