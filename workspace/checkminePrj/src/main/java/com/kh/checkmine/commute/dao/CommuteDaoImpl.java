package com.kh.checkmine.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.commute.vo.CommuteVo;

@Repository
public class CommuteDaoImpl implements CommuteDao {

	//나의근태조회
	@Override
	public List<CommuteVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("commuteMapper.selectList");
	}

}
