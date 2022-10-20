package com.kh.checkmine.board.service;

import java.util.List;

import com.kh.checkmine.board.vo.ReplyVo;

public interface ReplyService {

	List<ReplyVo> selectReplyList(String no);

}
