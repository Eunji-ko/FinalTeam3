package com.kh.checkmine.admin.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

public interface AdminGoodsService {

	//총 공유물 수
	int selectTotalCnt(String sort);

	//공유물 리스트
	List<GoodsVo> selectGoodsList(PageVo pv, String sort);

	List<PlaceVo> selectPlaceList(PageVo pv, String sort);
 
	//예약리스트
	List<PlaceBookVo> selectPlaceBook(String no);

	List<GoodsBookVo> selectGoodsBook(String no);

	//항목 삭제
	int deletePlace(String no);

	int deleteGoods(String no);

	//공유물 등록
	int addList(HashMap<String, String> map);

	//검색 결과 - goods
	int selectKeywordGoodsCnt(HashMap<String, String> map);

	List<GoodsVo> selectGoodsKeyword(PageVo pv, HashMap<String, String> map);
	
	//검색 결과 - place
	int selectKeywordPlaceCnt(HashMap<String, String> map);

	List<PlaceVo> selectPlaceKeyword(PageVo pv, HashMap<String, String> map);
}
