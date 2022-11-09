package com.kh.checkmine.personnel.service;

import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;
import com.kh.checkmine.personnel.vo.EmpEvalVo;

public interface PersonnelService {

	List<MemberVo> selectMemberList(PageVo epv, HashMap<String, String> empMap);

	List<AccountVo> selectAccountList(PageVo apv, HashMap<String, String> accMap);

	MemberVo selectEmpByNo(String no);

	AccountVo selectAccByNo(String no);

	int editEmp(MemberVo vo);

	int editAcc(AccountVo vo);

	int insertAcc(AccountVo vo);

	int delAcc(List<String> no);

	int selectTotalCnt(HashMap<String, String> empMap);

	int selectTotalACnt(HashMap<String, String> accMap);

	EmpEvalVo findEmpEval(EmpEvalVo vo);

	int updateEval(EmpEvalVo vo);

	int insertEval(EmpEvalVo vo);

}
