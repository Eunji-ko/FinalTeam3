package com.kh.checkmine.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface MemberDao {

	MemberVo selectOneById(SqlSessionTemplate sst, MemberVo vo);

	int updatePwd(SqlSessionTemplate sst, MemberVo vo);

	int updateInfo(SqlSessionTemplate sst, MemberVo vo);

	MemberVo selectOneByNo(SqlSessionTemplate sst, String no);

	int updatePhoto(SqlSessionTemplate sst, MemberVo vo);

	String selectIdByMail(SqlSessionTemplate sst, String email);

	String selectMailByOne(SqlSessionTemplate sst, MemberVo vo);

	int updatePwdById(SqlSessionTemplate sst, MemberVo vo);

	List<MailVo> selectMailList(SqlSessionTemplate sst, String no);

	List<TaskOrderVo> selectTaskList(SqlSessionTemplate sst, String no);

	List<BoardVo> selectBoardList(SqlSessionTemplate sst, String no);

	List<ReplyVo> selectReplyList(SqlSessionTemplate sst, String no);

	List<ScheduleVo> selectEventList(SqlSessionTemplate sst, String no);

	int getPublicCnt(SqlSessionTemplate sst, String no);

}
