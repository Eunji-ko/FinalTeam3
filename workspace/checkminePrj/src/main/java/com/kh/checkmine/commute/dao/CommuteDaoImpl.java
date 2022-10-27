package com.kh.checkmine.commute.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.commute.vo.CommuteVo;

@Repository
public class CommuteDaoImpl implements CommuteDao {

	//나의근태조회
	@Override
	public List<CommuteVo> selectListOne(String no, PageVo pv, SqlSessionTemplate sst) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("commuteMapper.selectListOne", no, rb);
		
	}

	//출근 확인
	@Override
	public int insertArrived(CommuteVo vo, SqlSessionTemplate sst) {
		return sst.insert("commuteMapper.insertArrived", vo);
	}

	//퇴근 확인
	@Override
	public int updateLeave(CommuteVo vo, SqlSessionTemplate sst) {
		return sst.update("commuteMapper.updateLeave", vo);
	}

	//전체 근태기록
	@Override
	public List<CommuteVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("commuteMapper.selectList", null, rb);
	}

	//전체 근태 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("commuteMapper.selectCountAll");
	}

}
