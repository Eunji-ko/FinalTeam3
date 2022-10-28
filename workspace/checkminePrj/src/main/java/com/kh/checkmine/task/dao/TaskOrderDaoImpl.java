package com.kh.checkmine.task.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Repository
public class TaskOrderDaoImpl implements TaskOrderDao {

	//지시서 작성
	@Override
	public int insertOrder(SqlSessionTemplate sst, TaskOrderVo vo) {
		return sst.insert("taskOrderMapper.insertOrder", vo);
	}
	
	//지시서 작성 수신자 리스트
	@Override
	public List<MemberVo> selectWriteAttList(SqlSessionTemplate sst) {
		return sst.selectList("taskOrderMapper.selectWriteAttList");
	}

	//수신,참조 등록
	@Override
	public int insertOrderAtt(SqlSessionTemplate sst, TaskOrderAttVo orderAttVo) {
		return sst.insert("taskOrderMapper.insertOrderAtt", orderAttVo);
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
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());

		return sst.selectList("taskOrderMapper.selectList", null, rb);
	}

	//지시서 디테일
	@Override
	public TaskOrderVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskOrderMapper.selectOneByNo", no);
	}

	//지시서 디테일 - 수신자 조회
	@Override
	public TaskOrderAttVo selectAttOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskOrderMapper.selectAttOne", no);
	}	
	@Override
	public TaskOrderAttVo selectAttROne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskOrderMapper.selectAttROne", no);
	}
	
	//지시서 파일 목록
	@Override
	public List<TaskOrderFileVo> selectFileList(SqlSessionTemplate sst, String no) {
		return sst.selectList("taskOrderMapper.selectFileList", no);
	}
	
	//지시서 파일 다운로드
	@Override
	public List<TaskOrderFileVo> selectFile(SqlSessionTemplate sst, String pno) {
		return sst.selectList("taskOrderMapper.selectFile", pno);
	}

	//보고서 작성할 때 지시서 연결
	@Override
	public List<TaskOrderVo> selectListForAtt(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("taskOrderMapper.selectListForAtt", empNo);
	}

	//게시글 검색 + 조회된 게시글 수
	@Override
	public int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("taskOrderMapper.selectTotalKeyword", map);
	}

	//게시글 검색
	@Override
	public List<TaskOrderVo> selectOrderKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("taskOrderMapper.selectOrderKeyword", map, rb);
	}


}
