package com.kh.checkmine.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

public interface PersonnelDao {

	List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo epv, HashMap<String, String> empMap);

	List<AccountVo> selectAccountList(SqlSessionTemplate sst, PageVo apv, HashMap<String, String> accMap);

	MemberVo selectEmpByNo(SqlSessionTemplate sst, String no);

	AccountVo selectAccByNo(SqlSessionTemplate sst, String no);

	int editEmp(SqlSessionTemplate sst, MemberVo vo);

	int editAcc(SqlSessionTemplate sst, AccountVo vo);

	List<MemberVo> selectMemberListByRsn(SqlSessionTemplate sst, String rsn);

	List<MemberVo> selectMemberListBySearch(SqlSessionTemplate sst, HashMap<String, String> searchMap);

	List<AccountVo> selectAccountListBySearch(SqlSessionTemplate sst, HashMap<String, String> searchMap);

	int insertAcc(SqlSessionTemplate sst, AccountVo vo);

	int delAcc(SqlSessionTemplate sst, List<String> no);

	int selectCountAll(SqlSessionTemplate sst);

	int selectCountAAll(SqlSessionTemplate sst);

}
