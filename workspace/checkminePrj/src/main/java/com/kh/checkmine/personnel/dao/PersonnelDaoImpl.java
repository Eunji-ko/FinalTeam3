package com.kh.checkmine.personnel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

@Repository
public class PersonnelDaoImpl implements PersonnelDao {

	@Override
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo epv, HashMap<String, String> empMap) {
		int offset = (epv.getCurrentPage() -1) * epv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, epv.getBoardLimit());
		
		return sst.selectList("personnelMapper.selectMemberList", empMap, rb);
	}

	@Override
	public List<AccountVo> selectAccountList(SqlSessionTemplate sst, PageVo apv, HashMap<String, String> accMap) {
		int offset = (apv.getCurrentPage() -1) * apv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, apv.getBoardLimit());
		
		return sst.selectList("personnelMapper.selectAccountList", accMap, rb);
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
	public int insertAcc(SqlSessionTemplate sst, AccountVo vo) {
		return sst.insert("personnelMapper.insertAcc", vo);
	}

	@Override
	public int delAcc(SqlSessionTemplate sst, List<String> no) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("abc", no);
		return sst.update("personnelMapper.delAcc", map);
	}

	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("personnelMapper.selectCountAll");
	}

	@Override
	public int selectCountAAll(SqlSessionTemplate sst) {
		return sst.selectOne("personnelMapper.selectCountAAll");
	}

}
