package com.kh.checkmine.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	//현재 사원의 결재대기문서 전체 조회
	@Override
	public int selectCountApAll(SqlSessionTemplate sst, String employeeNo) {
		return sst.selectOne("approvalMapper.selectCountApAll",employeeNo);
	}

	//사원번호로 결재대기문서 전체 리스트 조회 
	@Override
	public List<ApprovalDocVo> selectApListAll(SqlSessionTemplate sst, String employeeNo, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1)*pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("approvalMapper.selectApListAll", employeeNo, rb);
	}

	//문서번호로 결재문서 조회하기
	@Override
	public ApprovalDocVo selectDoc(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectDoc", dno);
	}

	//문서번호로 결재정보 조회해오기
	@Override
	public ApprovalVo selectAp(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectAp", dno);
	}

	//문서번호로 기안서 조회하기
	@Override
	public ApprovalDraftVo selectDraft(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectDraft", dno);
	}

	//사원번호로 작성자검색
	@Override
	public MemberVo selectWriter(SqlSessionTemplate sst, String writerNo) {
		return sst.selectOne("approvalMapper.selectWriter", writerNo);
	}

	//문서번호로 제안서 조회하기
	@Override
	public ApprovalProposalVo selectProposal(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectProposal", dno);
	}

	//문서번호로 회의록 조회하기
	@Override
	public ApprovalMinutesVo selectMinutes(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectMinutes", dno);
	}

	//문서번호로 지출결의서 조회하기
	@Override
	public ApprovalExpenditureVo selectExpenditure(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectExpenditure", dno);
	}

	//문서번호로 구매품의서 조회하기
	@Override
	public ApprovalBuyOrderVo selectBuyOrder(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("apprvalMapper.selectBuyOrder", dno);
	}

	//문서번호로 전표 조회하기
	@Override
	public ApprovalStateVo selectState(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectState", dno);
	}

	//문서번호로 휴가 조회하기
	@Override
	public ApprovalLeaveVo selectLeave(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectLeave", dno);
	}

	//사원 이름으로 사원 검색
	@Override
	public List<MemberVo> selectEmpList(SqlSessionTemplate sst, String approver) {
		return sst.selectList("approvalMapper.selectEmpList", approver);
	}

}
