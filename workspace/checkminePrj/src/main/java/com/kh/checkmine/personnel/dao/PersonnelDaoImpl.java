package com.kh.checkmine.personnel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

@Repository
public class PersonnelDaoImpl implements PersonnelDao {

	@Override
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst) {
		return sst.selectList("personnelMapper.selectMemberList");
	}

	@Override
	public List<AccountVo> selectAccountList(SqlSessionTemplate sst) {
		return sst.selectList("personnelMapper.selectAccountList");
	}

	@Override
	public MemberVo selectEmpByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("personnelMapper.selectOneByNo", no);
	}

	@Override
	public AccountVo selectAccByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("personnelMapper.selectAccByNo", no);
	}

	@Override
	public int editEmp(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("personnelMapper.editEmp", vo);
	}

	@Override
	public int editAcc(SqlSessionTemplate sst, AccountVo vo) {
		return sst.update("personnelMapper.editAcc", vo);
	}

}
