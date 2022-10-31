package com.kh.checkmine.task.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.vo.TaskReportAttVo;
import com.kh.checkmine.task.vo.TaskReportFileVo;
import com.kh.checkmine.task.vo.TaskReportVo;

@Repository
public class TaskReportDaoImpl implements TaskReportDao {

	//보고서 작성 화면 - 수신자 리스트
	@Override
	public List<MemberVo> selectWriteAttList(SqlSessionTemplate sst) {
		return sst.selectList("taskOrderMapper.selectWriteAttList");
	}
	
	//보고서 등록
	@Override
	public int insertReport(SqlSessionTemplate sst, TaskReportVo reportVo) {
		return sst.insert("taskReportMapper.insertReport", reportVo);
	}

	//수신참조 등록
	@Override
	public int insertReportAtt(SqlSessionTemplate sst, TaskReportAttVo taskReportAttVo) {
		return sst.insert("taskReportMapper.insertReportAtt", taskReportAttVo);
	}

	//파일 첨부
	@Override
	public int insertFile(SqlSessionTemplate sst, TaskReportFileVo taskReportFileVo) {
		return sst.insert("taskReportMapper.insertFile", taskReportFileVo);
	}

	//전체 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("taskReportMapper.selectCountAll");
	}

	//목록 조회
	@Override
	public List<TaskReportVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());

		return sst.selectList("taskReportMapper.selectList", null, rb);
	}

	//상세 조회
	@Override
	public TaskReportVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskReportMapper.selectOneByNo", no);
	}

		//수신
	@Override
	public TaskReportAttVo selectAttOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskReportMapper.selectAttOne", no);
	}
		//참조
	@Override
	public TaskReportAttVo selectAttROne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("taskReportMapper.selectAttROne", no);
	}
		//파일 목록
	@Override
	public List<TaskReportFileVo> selectFileForReportNo(SqlSessionTemplate sst, String no) {
		return sst.selectList("taskReportMapper.selectFileForReportNo", no);
	}
		//파일 다운로드
	@Override
	public List<TaskReportFileVo> selectFileForNo(SqlSessionTemplate sst, String fno) {
		return sst.selectList("taskReportMapper.selectFileForNo", fno);
	}

	@Override
	public int selectKeywordCnt(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("taskReportMapper.selectKeywordCnt", map);
	}

	@Override
	public List<TaskReportVo> selectReportKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("taskReportMapper.selectReportKeyword", map, rb);
	}

}
