package com.kh.checkmine.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.member.dao.MemberDao;
import com.kh.checkmine.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	
	@Autowired
	public MemberServiceImpl(SqlSessionTemplate sst, MemberDao dao) {
		this.sst = sst;
		this.dao = dao;
		
	}

	@Override
	public MemberVo login(MemberVo vo) {
		
		MemberVo dbMember = dao.selectOneById(sst, vo);
		
		return dbMember;
	}

}
