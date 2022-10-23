package com.kh.checkmine.personnel.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.dao.PersonnelDao;
import com.kh.checkmine.personnel.vo.AccountVo;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	private final SqlSessionTemplate sst;
	private final PersonnelDao dao;
	
	@Autowired
	public PersonnelServiceImpl(SqlSessionTemplate sst, PersonnelDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	@Override
	public List<MemberVo> selectMemberList() {
		return dao.selectMemberList(sst);
	}

	@Override
	public List<AccountVo> selectAccountList() {
		return dao.selectAccountList(sst);
	}


}
