package com.kh.checkmine.member.service;

import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface MemberService {

	MemberVo login(MemberVo vo);

	int changePwd(MemberVo vo);

	int changeInfo(MemberVo vo);

	MemberVo selectOneByNo(String no);

	MemberVo changePhoto(MemberVo vo);

	String findIdByMail(String email);

	String findMailByVo(MemberVo vo);

	int changePwdById(MemberVo vo);

	HashMap<String, Object> getUserInfo(String access_Token);

	String getAccessToken(String code);

	List<MailVo> selectMailList(String no);

	List<TaskOrderVo> selectTaskList(String no);

	List<BoardVo> selectBoardList(String no);

	List<ReplyVo> selectReplyList(String no);

	List<ScheduleVo> selectEventList(String no);

	int getPublicCnt(String no);

}
