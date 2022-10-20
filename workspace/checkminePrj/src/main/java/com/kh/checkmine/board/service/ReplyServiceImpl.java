package com.kh.checkmine.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.board.dao.ReplyDao;
import com.kh.checkmine.board.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	private final ReplyDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public ReplyServiceImpl(ReplyDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	
	//댓글 리스트 가져오기
	@Override
	public List<ReplyVo> selectReplyList(String no) {
		return dao.selectList(sst, no);
	}

}
