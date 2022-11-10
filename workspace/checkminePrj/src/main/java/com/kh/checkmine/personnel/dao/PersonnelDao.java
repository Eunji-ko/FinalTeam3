package com.kh.checkmine.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;
import com.kh.checkmine.personnel.vo.EmpEvalVo;

public interface PersonnelDao {

	List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo epv, HashMap<String, String> empMap);

	List<AccountVo> selectAccountList(SqlSessionTemplate sst, PageVo apv, HashMap<String, String> accMap);

	MemberVo selectEmpByNo(SqlSessionTemplate sst, String no);

	AccountVo selectAccByNo(SqlSessionTemplate sst, String no);

	int editEmp(SqlSessionTemplate sst, MemberVo vo);

	int editAcc(SqlSessionTemplate sst, AccountVo vo);

	int insertAcc(SqlSessionTemplate sst, AccountVo vo);

	int delAcc(SqlSessionTemplate sst, List<String> no);

	int selectCountAll(SqlSessionTemplate sst, HashMap<String, String> empMap);

	int selectCountAAll(SqlSessionTemplate sst, HashMap<String, String> accMap);

	EmpEvalVo findEmpEval(SqlSessionTemplate sst, EmpEvalVo vo);

	int updateEval(SqlSessionTemplate sst, EmpEvalVo vo);

	int insertEval(SqlSessionTemplate sst, EmpEvalVo vo);

	List<EmpEvalVo> findEvalList(SqlSessionTemplate sst, String no);

}
