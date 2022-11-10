package com.kh.checkmine.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

public interface ReservationDao {

	//내가 예약한 공유물
	List<GoodsBookVo> selectListGoods(String no, PageVo pv, SqlSessionTemplate sst);

	//내가 예약한 공유물 총갯수
	int goodsrsvTotalCount(String no, SqlSessionTemplate sst);
	
	//내가 예약한 장소
	List<PlaceBookVo> selectListPlace(String no, PageVo pv, SqlSessionTemplate sst);

	//내가 예약한 장소 총갯수
	int placersvTotalCount(String no, SqlSessionTemplate sst);
	
	//공유물 예약 취소
	int goodsDelbtn(GoodsBookVo vo, SqlSessionTemplate sst);

	//장소 예약 취소
	int placeDelbtn(PlaceBookVo vo, SqlSessionTemplate sst);

	//빔
	List<GoodsVo> selectBimList(SqlSessionTemplate sst);

	//빔 예약
	int insertRsvb(GoodsBookVo vo, SqlSessionTemplate sst);

	//빔 예약 목록
	List<GoodsBookVo> selectListBimRsv(PageVo pv, SqlSessionTemplate sst);

	//빔 예약 페이징
	int bimrsvTotalCount(SqlSessionTemplate sst);

	//차
	List<GoodsVo> selectCarList(SqlSessionTemplate sst);

	//차 예약
	int insertRsvc(GoodsBookVo vo, SqlSessionTemplate sst);

	//차 예약 목록
	List<GoodsBookVo> selectListCarRsv(PageVo pv, SqlSessionTemplate sst);

	//차 예약 총갯수
	int carrsvTotalCount(SqlSessionTemplate sst);

	//응접실
	List<PlaceVo> selectLiList(SqlSessionTemplate sst);

	//응접실 예약
	int insertRsvl(PlaceBookVo vo, SqlSessionTemplate sst);

	//응접실 예약 목록
	List<PlaceBookVo> selectListLiRsv(PageVo pv, SqlSessionTemplate sst);

	//응접실 예약 총갯수
	int lirsvTotalCount(SqlSessionTemplate sst);

	//회의실
	List<PlaceVo> selectMeList(SqlSessionTemplate sst);

	//회의실 예약
	int insertRsvm(PlaceBookVo vo, SqlSessionTemplate sst);

	//회의실 예약 목록
	List<PlaceBookVo> selectListMeRsv(PageVo pv, SqlSessionTemplate sst);

	//회의실 예약 총갯수
	int mersvTotalCount(SqlSessionTemplate sst);

	//예약 검증
	int selectRevCount(GoodsBookVo vo, SqlSessionTemplate sst);

}
