package com.kh.checkmine.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
import com.kh.checkmine.personnel.vo.AccountVo;

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
	public List<ApprovalExpenditureVo> selectExpenditure(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectExpenditure", dno);
	}

	//문서번호로 구매품의서 조회하기
	@Override
	public ApprovalBuyOrderVo selectBuyOrder(SqlSessionTemplate sst, String dno) {
		return sst.selectOne("approvalMapper.selectBuyOrder", dno);
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

	//반려사유 업데이트
	@Override
	public int updateReturn(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.update("approvalMapper.updateReturn", apVo);
	}

	//최종 결재 후 결재정보 업데이트
	@Override
	public int updateStatus(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.update("approvalMapper.updateStatus", apVo);
	}

	//1차 결재일 업데이트
	@Override
	public int updateDate1(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.update("approvalMapper.updateDate1", apVo);
	}

	//2차 결재일 업데이트
	@Override
	public int updateDate2(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.update("approvalMapper.updateDate2", apVo);
	}

	//3차 결재일 업데이트
	@Override
	public int updateDate3(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.update("approvalMapper.updateDate3", apVo);
	}

	//문서정보 DB에 올리기
	@Override
	public int insertDoc(SqlSessionTemplate sst, ApprovalDocVo docVo) {
		return sst.insert("approvalMapper.insertDoc", docVo);
	}

	//결재정보 DB에 올리기
	@Override
	public int insertApproval(SqlSessionTemplate sst, ApprovalVo apVo) {
		return sst.insert("approvalMapper.insertApproval", apVo);
	}

	//기안서 정보 DB에 올리기
	@Override
	public int insertDraft(SqlSessionTemplate sst, ApprovalDraftVo draftVo) {
		return sst.insert("approvalMapper.insertDraft", draftVo);
	}

	//파일정보 DB에 올리기
	@Override
	public int insertFile(SqlSessionTemplate sst, ApprovalFileVo fileVo) {
		return sst.insert("approvalMapper.insertFile", fileVo);
	}

	//가장 최근 등록된 문서 정보 조회
	@Override
	public ApprovalDocVo selectCurrentDoc(SqlSessionTemplate sst) {
		return sst.selectOne("approvalMapper.selectCurrentDoc");
	}

	//문서번호로 첨부파일 조회하기
	@Override
	public List<ApprovalFileVo> selectFiles(SqlSessionTemplate sst, String dno) {
		return sst.selectList("approvalMapper.selectFiles", dno);
	}

	//제안서 DB에 올리기
	@Override
	public int insertProposal(SqlSessionTemplate sst, ApprovalProposalVo proposalVo) {
		return sst.insert("approvalMapper.insertProposal", proposalVo);
	}

	//이름으로 거래처 검색
	@Override
	public List<AccountVo> selectAccountList(SqlSessionTemplate sst, String corporate) {
		return sst.selectList("approvalMapper.selectAccountList", corporate);
	}

	//회의록 DB에 올리기
	@Override
	public int insertMinutes(SqlSessionTemplate sst, ApprovalMinutesVo minutesVo) {
		return sst.insert("approvalMapper.insertMinutes", minutesVo);
	}

	//지출결의서 db에 올리기
	@Override
	public int insertExpenditure(SqlSessionTemplate sst, ApprovalExpenditureVo expenditureVo) {
		return sst.insert("approvalMapper.insertExpenditure", expenditureVo);
	}

	//구매품의서 DB에 올리기
	@Override
	public int insertBuyOrder(SqlSessionTemplate sst, ApprovalBuyOrderVo buyOrderVo) {
		return sst.insert("approvalMapper.insertBuyOrder", buyOrderVo);
	}

	//지출결의서 리스트 DB에 올리기
	@Override
	public int insertExpenditureList(SqlSessionTemplate sst, List<ApprovalExpenditureVo> expList) {
		return sst.insert("approvalMapper.insertExpenditureList", expList);
	}

	//전표 리스트 DB에 올리기
	@Override
	public int insertStateList(SqlSessionTemplate sst, List<ApprovalStateVo> stateList) {
		return sst.insert("approvalMapper.insertStateList", stateList);
	}

}
