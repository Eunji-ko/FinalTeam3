package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

public interface AdminMemberDao {

	//총사원수
	int selectTotalCnt(SqlSessionTemplate sst, String sort);

	//사원 리스트
	List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo pv, String sort);

}
