package com.kh.checkmine.admin.dao;

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

}
