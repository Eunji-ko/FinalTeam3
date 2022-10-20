package com.kh.checkmine.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.member.vo.MemberVo;

public interface MemberDao {

	MemberVo selectOneById(SqlSessionTemplate sst, MemberVo vo);

}
