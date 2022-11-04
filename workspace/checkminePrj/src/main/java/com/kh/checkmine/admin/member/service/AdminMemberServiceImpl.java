package com.kh.checkmine.admin.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.member.dao.AdminMemberDao;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.DeptVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.member.vo.PosVo;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	private final AdminMemberDao dao;
	private final SqlSessionTemplate sst;
	private final BCryptPasswordEncoder pwdEnc;
	
	public AdminMemberServiceImpl(AdminMemberDao dao, SqlSessionTemplate sst, BCryptPasswordEncoder pwdEnc) {
		this.dao = dao;
		this.sst = sst;
		this.pwdEnc = pwdEnc;
		
	}

	//총 사원 수
	@Override
	public int selectTotalCnt(String sort) {
		return dao.selectTotalCnt(sst, sort);
	}

	//사원 리스트
	@Override
	public List<MemberVo> selectMemberList(PageVo pv, String sort) {
		return dao.selectMemberList(sst, pv, sort);
	}

	//검색 결과 수
	@Override
	public int selectKeywordCnt(Map<String, String> map) {
		return dao.selectKeywordCnt(sst, map);
	}

	//검색결과
	@Override
	public List<MemberVo> selectMemberKeyword(PageVo pv, Map<String, String> map) {
		return dao.selectMemberKeyword(sst, pv, map);
	}

	//부서, 직위 가져오기
	@Override
	public List<DeptVo> selectDeptList() {
		return dao.selectDeptList(sst);
	}

	@Override
	public List<PosVo> selectPosList() {
		return dao.selectPosList(sst);
	}

	//중복확인
	@Override
	public String checkDup(String id) {
		return dao.checkDup(sst, id);
	}

	//사원등록
	@Override
	public int insertMember(MemberVo vo) {
		
		vo.encodePwd(pwdEnc);
		
		return dao.insertMember(sst, vo);
	}

	//사원조회
	@Override
	public MemberVo selectMember(String no) {
		return dao.selectMember(sst, no);
	}

	//사원수정
	@Override
	public int edit(MemberVo vo) {
		return dao.updateMember(sst, vo);
	}

	//조직도
	@Override
	public List<Map<String, String>> memberChart() {
		return dao.selectMemberCnt(sst);
	}

	//영구 삭제
	@Override
	public int delete(String memberNo) {
		int result = dao.delete(sst, memberNo);
		return result;
	}
	
	

}
