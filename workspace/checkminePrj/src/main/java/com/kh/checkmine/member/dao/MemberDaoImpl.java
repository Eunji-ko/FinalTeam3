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

	@Override
	public int updatePwd(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePwd", vo);
	}

	@Override
	public int updateInfo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateInfo", vo);
	}

	@Override
	public MemberVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("memberMapper.selectOneByNo", no);
	}

	@Override
	public int updatePhoto(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePhoto", vo);
	}

}
