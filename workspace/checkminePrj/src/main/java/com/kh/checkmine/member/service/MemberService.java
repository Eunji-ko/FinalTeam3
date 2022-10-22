package com.kh.checkmine.member.service;

import com.kh.checkmine.member.vo.MemberVo;

public interface MemberService {

	MemberVo login(MemberVo vo);

	int changePwd(MemberVo vo);

	int changeInfo(MemberVo vo);

	MemberVo selectOneByNo(String no);

}
