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
	
}
