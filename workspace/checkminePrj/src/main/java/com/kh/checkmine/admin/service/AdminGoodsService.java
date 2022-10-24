package com.kh.checkmine.admin.service;

import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

public interface AdminGoodsService {

	//총 공유물 수
	int selectTotalCnt(String sort);

	//공유물 리스트
	List<GoodsVo> selectGoodsList(PageVo pv, String sort);

	List<PlaceVo> selectPlaceList(PageVo pv, String sort);

}
