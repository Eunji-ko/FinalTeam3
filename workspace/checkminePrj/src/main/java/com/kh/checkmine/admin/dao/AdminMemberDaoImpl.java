package com.kh.checkmine.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	//총 사원 수
	@Override
	public int selectTotalCnt(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("adminmMapper.selectTotalCnt", sort);
	}

	//사원 리스트
	@Override
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("adminmMapper.selectMemberList", sort, rb);
	}
	
	

}
