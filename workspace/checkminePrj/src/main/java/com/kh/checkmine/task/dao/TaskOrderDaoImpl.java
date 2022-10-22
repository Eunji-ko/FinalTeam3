package com.kh.checkmine.task.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Repository
public class TaskOrderDaoImpl implements TaskOrderDao {

	//지시서 작성
	@Override
	public int insertOrder(SqlSessionTemplate sst, TaskOrderVo vo) {
		return sst.insert("taskOrderMapper.insertReport", vo);
	}

	//수신,참조 등록
	@Override
	public int insertOrderAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo) {
		return sst.insert("taskOrderMapper.insertReportAtt", orderAttVo);
	}

	//파일 등록
	@Override
	public int insertFile(SqlSessionTemplate sst, TaskOrderFileVo taskOrderFileVo) {
		return sst.insert("taskOrderMapper.insertFile", taskOrderFileVo);
	}

	//게시글 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("taskOrderMapper.selectCountAll");
	}

	//게시글 목록 조회
	@Override
	public List<TaskOrderVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		return sst.selectList("taskOrderMapper.selectList");
	}

}
