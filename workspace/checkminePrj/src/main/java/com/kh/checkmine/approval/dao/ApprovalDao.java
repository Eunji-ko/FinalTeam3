package com.kh.checkmine.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

public interface ApprovalDao {

	//현재 사원의 결재대기문서 전체개수 조회
	int selectCountApAll(SqlSessionTemplate sst, String employeeNo);

	//사원번호로 결재대기문서 전체 리스트 조회 
	List<ApprovalDocVo> selectApListAll(SqlSessionTemplate sst, String employeeNo, PageVo pv);

	//문서번호로 결재문서 조회하기
	ApprovalDocVo selectDoc(SqlSessionTemplate sst, String dno);

	//문서번호로 결재정보 조회해오기
	ApprovalVo selectAp(SqlSessionTemplate sst, String dno);

	//문서번호로 기안서 조회하기
	ApprovalDraftVo selectDraft(SqlSessionTemplate sst, String dno);

	//사원번호로 작성자검색
	MemberVo selectWriter(SqlSessionTemplate sst, String writerNo);

}
