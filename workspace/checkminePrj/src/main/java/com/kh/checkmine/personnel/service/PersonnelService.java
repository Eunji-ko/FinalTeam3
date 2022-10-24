package com.kh.checkmine.personnel.service;

import java.util.List;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

public interface PersonnelService {

	List<MemberVo> selectMemberList();

	List<AccountVo> selectAccountList();

}