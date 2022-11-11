package com.kh.checkmine.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	//내가 예약한 공유물
	@Override
	public List<GoodsBookVo> selectListGoods(String no, PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationGoodsMapper.selectListGoods", no, rb);
	}
	
	//내가 예약한 공유물 총갯수
	@Override
	public int goodsrsvTotalCount(String no, SqlSessionTemplate sst) {
		return sst.selectOne("reservationGoodsMapper.goodsrsvTotalCount", no);
	}

	//내가 예약한 장소
	@Override
	public List<PlaceBookVo> selectListPlace(String no, PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationPlaceMapper.selectListPlace", no, rb);
	}
	
	//내가 예약한 장소 총갯수
	@Override
	public int placersvTotalCount(String no, SqlSessionTemplate sst) {
		return sst.selectOne("reservationPlaceMapper.placersvTotalCount", no);
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
	public List<GoodsVo> selectBimList(SqlSessionTemplate sst) {
		return sst.selectList("reservationGoodsMapper.selectBimList");
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

	//빔 예약 총갯수
	@Override
	public int bimrsvTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("reservationGoodsMapper.bimrsvTotalCount");
	}

	//차
	@Override
	public List<GoodsVo> selectCarList(SqlSessionTemplate sst) {
		return sst.selectList("reservationGoodsMapper.selectCarList");
	}

	//차 예약
	@Override
	public int insertRsvc(GoodsBookVo vo, SqlSessionTemplate sst) {
		return sst.insert("reservationGoodsMapper.insertRsvc", vo);
	}

	//차 예약 목록
	@Override
	public List<GoodsBookVo> selectListCarRsv(PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationGoodsMapper.selectListCarRsv", null, rb);
	}

	//차 예약 총갯수
	@Override
	public int carrsvTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("reservationGoodsMapper.carrsvTotalCount");
	}

	//응접실
	@Override
	public List<PlaceVo> selectLiList(SqlSessionTemplate sst) {
		return sst.selectList("reservationPlaceMapper.selectLiList");
	}

	//응접실 예약
	@Override
	public int insertRsvl(PlaceBookVo vo, SqlSessionTemplate sst) {
		return sst.insert("reservationPlaceMapper.insertRsvl", vo);
	}

	//응접실 예약 목록
	@Override
	public List<PlaceBookVo> selectListLiRsv(PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationPlaceMapper.selectListLiRsv", null, rb);
	}

	//응접실 예약 총갯수
	@Override
	public int lirsvTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("reservationPlaceMapper.lirsvTotalCount");
	}

	//회의실
	@Override
	public List<PlaceVo> selectMeList(SqlSessionTemplate sst) {
		return sst.selectList("reservationPlaceMapper.selectMeList");
	}

	//회의실 예약
	@Override
	public int insertRsvm(PlaceBookVo vo, SqlSessionTemplate sst) {
		return sst.insert("reservationPlaceMapper.insertRsvm", vo);
	}

	//회의실 예약 목록
	@Override
	public List<PlaceBookVo> selectListMeRsv(PageVo pv, SqlSessionTemplate sst) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
	    RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("reservationPlaceMapper.selectListMeRsv", null, rb);
	}

	//회의실 예약 총갯수
	@Override
	public int mersvTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("reservationPlaceMapper.mersvTotalCount");
	}

	//예약 검증
	@Override
	public int selectRevCount(GoodsBookVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("reservationGoodsMapper.selectRevCount", vo);
	}

	//예약 검증
	@Override
	public int selectRsvp(PlaceBookVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("reservationPlaceMapper.selectRsvp", vo);
	}

}
