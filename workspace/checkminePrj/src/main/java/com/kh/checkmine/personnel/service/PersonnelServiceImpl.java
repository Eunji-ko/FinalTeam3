package com.kh.checkmine.personnel.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
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
	public List<MemberVo> selectMemberList(PageVo epv, HashMap<String, String> empMap) {
		return dao.selectMemberList(sst, epv, empMap);
	}

	@Override
	public List<AccountVo> selectAccountList(PageVo apv, HashMap<String, String> accMap) {
		return dao.selectAccountList(sst, apv, accMap);
	}

	@Override
	public MemberVo selectEmpByNo(String no) {
		return dao.selectEmpByNo(sst, no);
	}

	@Override
	public AccountVo selectAccByNo(String no) {
		return dao.selectAccByNo(sst, no);
	}

	@Override
	public int editEmp(MemberVo vo) {
		return dao.editEmp(sst, vo);
	}

	@Override
	public int editAcc(AccountVo vo) {
		return dao.editAcc(sst, vo);
	}

	@Override
	public int insertAcc(AccountVo vo) {
		return dao.insertAcc(sst, vo);
	}

	@Override
	public int delAcc(List<String> no) {
		return dao.delAcc(sst, no);
	}

	@Override
	public int selectTotalCnt() {
		return dao.selectCountAll(sst);
	}

	@Override
	public int selectTotalACnt() {
		return dao.selectCountAAll(sst);
	}


}
