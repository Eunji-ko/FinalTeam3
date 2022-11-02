package com.kh.checkmine.admin.member.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.DeptVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.member.vo.PosVo;

public interface AdminMemberService {

	//총 사원 수
	int selectTotalCnt(String sort);

	//사원 리스트
	List<MemberVo> selectMemberList(PageVo pv, String sort);

	//사원 검색 결과 수
	int selectKeywordCnt(Map<String, String> map);

	//사원 검색 결과
	List<MemberVo> selectMemberKeyword(PageVo pv, Map<String, String> map);

	//부서, 직위 목록 가져오기
	List<DeptVo> selectDeptList();

	List<PosVo> selectPosList();

	//아이디 중복
	String checkDup(String id);

	//사원등록
	int insertMember(MemberVo vo);

	//사원조회
	MemberVo selectMember(String no);

	//사원 수정
	int edit(MemberVo vo);

	//조직도 인원
	List<Map<String, String>> memberChart();

}
