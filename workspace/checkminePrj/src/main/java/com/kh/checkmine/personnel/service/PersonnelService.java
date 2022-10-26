package com.kh.checkmine.personnel.service;

import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

public interface PersonnelService {

	List<MemberVo> selectMemberList();

	List<AccountVo> selectAccountList();

	MemberVo selectEmpByNo(String no);

	AccountVo selectAccByNo(String no);

	int editEmp(MemberVo vo);

	int editAcc(AccountVo vo);

	List<MemberVo> selectMemberListByRsn(String rsn);

	List<MemberVo> selectMemberListBySearch(HashMap<String, String> searchMap);

	List<AccountVo> selectAccountListBySearch(HashMap<String, String> searchMap);

}
