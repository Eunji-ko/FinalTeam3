package com.kh.checkmine.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public MemberVo selectOneById(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectOneById", vo);
	}

	@Override
	public int updatePwd(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePwd", vo);
	}

	@Override
	public int updateInfo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateInfo", vo);
	}

	@Override
	public MemberVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("memberMapper.selectOneByNo", no);
	}

	@Override
	public int updatePhoto(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePhoto", vo);
	}

	@Override
	public String selectIdByMail(SqlSessionTemplate sst, String email) {
		return sst.selectOne("memberMapper.selectIdByMail", email);
	}

	@Override
	public String selectMailByOne(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectMailByOne", vo);
	}

	@Override
	public int updatePwdById(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePwdById", vo);
	}

	@Override
	public List<MailVo> selectMailList(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectMailList", no);
	}

	@Override
	public List<TaskOrderVo> selectTaskList(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectTaskList", no);
	}

	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectBoardList", no);
	}

	@Override
	public List<ReplyVo> selectReplyList(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectReplyList", no);
	}

	@Override
	public List<ScheduleVo> selectEventList(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectEventList", no);
	}

	@Override
	public int getPublicCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("memberMapper.getPublicCnt", no);
	}

}
