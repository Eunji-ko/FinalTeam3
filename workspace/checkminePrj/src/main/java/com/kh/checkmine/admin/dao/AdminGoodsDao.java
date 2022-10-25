package com.kh.checkmine.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

public interface AdminGoodsDao {

	//총 공유물 수
	int selectGoodsTotal(SqlSessionTemplate sst, String sort);

	//게시물 리스트
	List<GoodsVo> selectGoodsList(SqlSessionTemplate sst, PageVo pv, String sort);
	
	List<PlaceVo> selectPlaceList(SqlSessionTemplate sst, PageVo pv, String sort);

	//예약 리스트
	List<PlaceBookVo> selectPlaceBook(SqlSessionTemplate sst, String no);

	List<GoodsBookVo> selectGoodsBook(SqlSessionTemplate sst, String no);

	//항목 삭제
	int deletePlace(SqlSessionTemplate sst, String placeNo);

	int deleteGoods(SqlSessionTemplate sst, String goodsNo);

	//공유물 등록
	int addList(SqlSessionTemplate sst, HashMap<String, String> map);

	
	//검색결과
	int selectGoodsTotalKeyword(SqlSessionTemplate sst, HashMap<String, String> map);

	List<GoodsVo> selectSearchGoodsList(SqlSessionTemplate sst, PageVo pv, HashMap<String, String> map);

	int selectPlaceTotalKeyword(SqlSessionTemplate sst, HashMap<String, String> map);

	List<PlaceVo> selectSearchPlaceList(SqlSessionTemplate sst, PageVo pv, HashMap<String, String> map);


}
