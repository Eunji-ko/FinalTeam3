package com.kh.checkmine.commute.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.commute.dao.CommuteDao;
import com.kh.checkmine.commute.vo.CommuteVo;

@Service
public class CommuteServiceImpl implements CommuteService {

	private final CommuteDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public CommuteServiceImpl(CommuteDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//나의근태조회
	@Override
	public List<CommuteVo> selectListOne(String no, PageVo pv) {
		return dao.selectListOne(no, pv, sst);
	}

	//출근 확인
	@Override
	public int arrived(CommuteVo vo) {
		return dao.insertArrived(vo, sst);
	}

	//퇴근 확인
	@Override
	public int leave(CommuteVo vo) {
		return dao.updateLeave(vo, sst);
	}

	//전체 근태기록
	@Override
	public List<CommuteVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}

	//전체 근태 갯수 조회
	@Override
	public int selectcommuteTotalCount() {
		return dao.selectCommuteCountAll(sst);
	}

	//나의 근태 갯수 조회
	@Override
	public int selectMycommuteTotalCnt(String no) {
		return dao.selectMycommuteCountAll(no, sst);
	}

	//부서별 조회
	@Override
	public List<CommuteVo> selectDeptList(String deptName) {
		return dao.selectDeptList(deptName, sst);
	}

	//직급별 조회
	@Override
	public List<CommuteVo> selectPosList(String posName) {
		return dao.selectPosList(posName, sst);
	}

}
