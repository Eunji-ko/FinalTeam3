package com.kh.checkmine.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminMemberDao;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	private final AdminMemberDao dao;
	private final SqlSessionTemplate sst;
	
	public AdminMemberServiceImpl(AdminMemberDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
		
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

}
