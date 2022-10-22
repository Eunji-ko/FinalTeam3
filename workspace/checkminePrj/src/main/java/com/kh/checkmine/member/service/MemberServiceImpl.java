package com.kh.checkmine.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.member.dao.MemberDao;
import com.kh.checkmine.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final BCryptPasswordEncoder pwdEnc;
	
	@Autowired
	public MemberServiceImpl(SqlSessionTemplate sst, MemberDao dao, BCryptPasswordEncoder pwdEnc) {
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

	@Override
	public int changePwd(MemberVo vo) {
		vo.encodePwd(pwdEnc);
		
		return dao.updatePwd(sst, vo);
	}

	@Override
	public int changeInfo(MemberVo vo) {
		return dao.updateInfo(sst, vo);
	}

	@Override
	public MemberVo selectOneByNo(String no) {
		return dao.selectOneByNo(sst, no);
	}

}//class
