package com.kh.checkmine.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	//내가 예약한 공유물
	@Override
	public List<GoodsBookVo> selectListGoods(String no, SqlSessionTemplate sst) {
		return sst.selectList("reservationGoodsMapper.selectListGoods", no);
	}

	//내가 예약한 장소
	@Override
	public List<PlaceBookVo> selectListPlace(String no, SqlSessionTemplate sst) {
		return sst.selectList("reservationPlaceMapper.selectListPlace", no);
	}

	//공유물 예약 취소
	@Override
	public int goodsDelbtn(GoodsBookVo vo, SqlSessionTemplate sst) {
		return sst.delete("reservationGoodsMapper.goodsDelbtn", vo);
	}

	//장소 예약 취소
	@Override
	public int placeDelbtn(PlaceBookVo vo, SqlSessionTemplate sst) {
		return sst.delete("reservationPlaceMapper.placeDelbtn", vo);
	}

	//빔
	@Override
	public List<GoodsVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("reservationGoodsMapper.selectList");
	}

	//빔 예약
	@Override
	public int insertRsvb(GoodsBookVo vo, SqlSessionTemplate sst) {
		return sst.insert("reservationGoodsMapper.insertRsvb", vo);
	}

	//빔 예약 목록
	@Override
	public List<GoodsBookVo> selectListBimRsv(PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationGoodsMapper.selectListBimRsv", null, rb);
	}

	//빔 예약 페이징
	@Override
	public int bimrsvTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("reservationGoodsMapper.bimrsvTotalCount");
	}

}
