package com.kh.checkmine.task.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.dao.TaskReportDao;
import com.kh.checkmine.task.vo.TaskOrderVo;
import com.kh.checkmine.task.vo.TaskReportAttVo;
import com.kh.checkmine.task.vo.TaskReportFileVo;
import com.kh.checkmine.task.vo.TaskReportVo;

@Service
public class TaskReportServiceImpl implements TaskReportService {
	
	private final TaskReportDao reportDao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public TaskReportServiceImpl(TaskReportDao reportDao, SqlSessionTemplate sst) {
		this.reportDao = reportDao;
		this.sst = sst;
	}
	
	//지시서 작성
		//지시서 + 수신참조 + 파일
	@Override
	public int write(TaskReportVo reportVo, List<TaskReportAttVo> attVoList, List<TaskReportFileVo> fileVoList) {
		int result1 = reportDao.insertReport(sst, reportVo);
		int result2 = 1; //수신,참조 첨부
		int result3 = 1; //파일 첨부

		for(int i = 0; i < attVoList.size(); i++) {
			result2 = reportDao.insertReportAtt(sst, attVoList.get(i));
		}
		
		for(int j = 0; j < fileVoList.size(); j++) {
			result3 *= reportDao.insertFile(sst, fileVoList.get(j)); 
		}
		
		return result1 * result2 * result3;
	}
	
		//지시서 + 수신참조 
	@Override
	public int write(TaskReportVo reportVo, List<TaskReportAttVo> attVoList) {
		int result1 = reportDao.insertReport(sst, reportVo);
		int result2 = 1; //수신,참조 첨부

		for(int i = 0; i < attVoList.size(); i++) {
			result2 = reportDao.insertReportAtt(sst, attVoList.get(i));
		}
		
		return result1 * result2;
	}

	//전체 갯수 조회
	@Override
	public int selectTotalCnt() {
		return reportDao.selectCountAll(sst);
	}

	//목록 조회
	@Override
	public List<TaskReportVo> selectList(PageVo pv) {
		return reportDao.selectList(sst, pv);
	}

	//상세 조회
	@Override
	public TaskReportVo selectOneByNo(String no) {
		return reportDao.selectOneByNo(sst, no);
	}

	//상세 조회 - 수신
	@Override
	public TaskReportAttVo selectAttOne(String no) {
		return reportDao.selectAttOne(sst, no);
	}

	//상세 조회 - 참조
	@Override
	public TaskReportAttVo selectAttROne(String no) {
		return reportDao.selectAttROne(sst, no);
	}

	//상세 조회 - 파일 목록
	@Override
	public List<TaskReportFileVo> selectFileForReportNo(String no) {
		return reportDao.selectFileForReportNo(sst, no);
	}

	//상세 조회 - 파일 다운로드
	@Override
	public List<TaskReportFileVo> selectFileForNo(String fno) {
		return reportDao.selectFileForNo(sst, fno);
	}

	@Override
	public List<MemberVo> selectWriteAttList() {
		return reportDao.selectWriteAttList(sst);
	}

	@Override
	public int selectKeywordCnt(Map<String, String> map) {
		return reportDao.selectKeywordCnt(sst, map);
	}

	@Override
	public List<TaskReportVo> selectReportKeyword(PageVo pv, Map<String, String> map) {
		return reportDao.selectReportKeyword(sst, pv, map);
	}

	//수신참고용 멤버 목록
	@Override
	public List<MemberVo> selectMemberList() {
		return reportDao.selectMemberList(sst);
	}

}
