package com.kh.checkmine.task.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderDao {

	//지시서 작성
	int insertOrder(SqlSessionTemplate sst, TaskOrderVo vo);

	//수신, 참조 등록
	int insertOrderAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo);

	//파일 등록
	int insertFile(SqlSessionTemplate sst, TaskOrderFileVo taskOrderFileVo);

	//전체 게시글 조회
	int selectCountAll(SqlSessionTemplate sst);

	//게시글 목록 조회
	List<TaskOrderVo> selectList(SqlSessionTemplate sst, PageVo pv);

	//수신자 목록 조회
	List<TaskOrderAttVo> selectAttList(SqlSessionTemplate sst, TaskOrderAttVo attVo);

	//지시서 디테일
	TaskOrderVo selectOne(SqlSessionTemplate sst, String no);

	//지시서 디테일 - 수신자 조회
	TaskOrderAttVo selectAttOne(SqlSessionTemplate sst, String no);

}
