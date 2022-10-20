package com.kh.checkmine.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public MemberVo selectOneById(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectOneById", vo);
	}

}
