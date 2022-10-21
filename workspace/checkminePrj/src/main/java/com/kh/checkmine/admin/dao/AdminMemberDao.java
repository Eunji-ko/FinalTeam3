package com.kh.checkmine.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.DeptVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.member.vo.PosVo;

public interface AdminMemberDao {

	//총사원수
	int selectTotalCnt(SqlSessionTemplate sst, String sort);

	//사원 리스트
	List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo pv, String sort);

	//검색 결과 수
	int selectKeywordCnt(SqlSessionTemplate sst, Map<String, String> map);

	//사원 검색 결과
	List<MemberVo> selectMemberKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	//부서, 직위 목록 가져오기
	List<DeptVo> selectDeptList(SqlSessionTemplate sst);

	List<PosVo> selectPosList(SqlSessionTemplate sst);

	//중복 확인
	String checkDup(SqlSessionTemplate sst, String id);

	//사원 등록
	int insertMember(SqlSessionTemplate sst, MemberVo vo);

	//사원 조회
	MemberVo selectMember(SqlSessionTemplate sst, String no);

}
