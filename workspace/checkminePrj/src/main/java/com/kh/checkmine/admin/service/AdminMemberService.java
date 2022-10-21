package com.kh.checkmine.admin.service;

import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

public interface AdminMemberService {

	//총 사원 수
	int selectTotalCnt(String sort);

	//사원 리스트
	List<MemberVo> selectMemberList(PageVo pv, String sort);

}
