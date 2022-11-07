package com.kh.checkmine.board.service;

import java.util.List;

import com.kh.checkmine.board.vo.ReplyVo;

public interface ReplyService {

	//댓글 리스트
	List<ReplyVo> selectReplyList(String no);

	//댓글 작성
	int reply(ReplyVo replyVo);

	//댓글 삭제
	int replyDelete(ReplyVo replyVo);
}
