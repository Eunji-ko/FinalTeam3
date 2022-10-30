package com.kh.checkmine.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.member.vo.MemberVo;

public interface MemberDao {

	MemberVo selectOneById(SqlSessionTemplate sst, MemberVo vo);

	int updatePwd(SqlSessionTemplate sst, MemberVo vo);

	int updateInfo(SqlSessionTemplate sst, MemberVo vo);

	MemberVo selectOneByNo(SqlSessionTemplate sst, String no);

	int updatePhoto(SqlSessionTemplate sst, MemberVo vo);

}
