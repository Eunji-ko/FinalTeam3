package com.kh.checkmine.personnel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<MemberVo> selectMemberListByRsn(SqlSessionTemplate sst, String rsn) {
		return sst.selectList("personnelMapper.selectMemberListByRsn", rsn);
	}

	@Override
	public List<MemberVo> selectMemberListBySearch(SqlSessionTemplate sst, HashMap<String, String> searchMap) {
		return sst.selectList("personnelMapper.selectMemberListBySearch", searchMap);
	}

	@Override
	public List<AccountVo> selectAccountListBySearch(SqlSessionTemplate sst, HashMap<String, String> searchMap) {
		return sst.selectList("personnelMapper.selectAccountListBySearch", searchMap);
	}

	@Override
	public int insertAcc(SqlSessionTemplate sst, AccountVo vo) {
		return sst.insert("personnelMapper.insertAcc", vo);
	}

	@Override
	public int delAcc(SqlSessionTemplate sst, List<String> no) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("abc", no);
		return sst.update("personnelMapper.delAcc", map);
	}

}
