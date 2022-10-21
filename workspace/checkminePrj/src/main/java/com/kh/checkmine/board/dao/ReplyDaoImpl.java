package com.kh.checkmine.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.ReplyVo;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	//댓글 가져오기
	@Override
	public List<ReplyVo> selectList(SqlSessionTemplate sst, String no) {
		return sst.selectList("replyMapper.selectListByBno", no);
	}

	//댓글 작성하기
	@Override
	public int insertOne(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.insert("replyMapper.insertOne", vo);
	}

	//댓글 삭제
	@Override
	public int deleteOne(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.update("replyMapper.deleteOne", vo);
	}
	
}
