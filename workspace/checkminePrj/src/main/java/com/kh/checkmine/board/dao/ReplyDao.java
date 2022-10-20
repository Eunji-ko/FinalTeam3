package com.kh.checkmine.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.ReplyVo;

public interface ReplyDao {

	//댓글 가져오기
	List<ReplyVo> selectList(SqlSessionTemplate sst, String no);

}
