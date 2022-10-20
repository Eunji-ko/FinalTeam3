package com.kh.checkmine.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.member.dao.MemberDao;
import com.kh.checkmine.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final PasswordEncoder pwdEnc;
	
	@Autowired
	public MemberServiceImpl(SqlSessionTemplate sst, MemberDao dao, PasswordEncoder pwdEnc) {
		this.sst = sst;
		this.dao = dao;
		this.pwdEnc = pwdEnc;
	}

	@Override
	public MemberVo login(MemberVo vo) {
		
		MemberVo dbMember = dao.selectOneById(sst, vo);
		
		if(pwdEnc.matches(vo.getPwd(), dbMember.getPwd())) {			
			return dbMember;
		}else {
			return null;
		}
		
	}

}//class
