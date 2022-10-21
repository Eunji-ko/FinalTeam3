package com.kh.checkmine.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.ReplyVo;

public interface ReplyDao {

	//댓글 가져오기
	List<ReplyVo> selectList(SqlSessionTemplate sst, String no);

	//댓글 작성하기
	int insertOne(SqlSessionTemplate sst, ReplyVo vo);

	//댓글 삭제하기
	int deleteOne(SqlSessionTemplate sst, ReplyVo vo);

}
