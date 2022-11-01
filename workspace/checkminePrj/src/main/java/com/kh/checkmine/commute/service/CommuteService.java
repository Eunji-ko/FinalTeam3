package com.kh.checkmine.commute.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.approval.vo.ApprovalLeaveVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.commute.vo.CommuteVo;

public interface CommuteService {

	//나의근태조회
	List<CommuteVo> selectListOne(String no, PageVo pv);

	//출근 확인
	int arrived(CommuteVo vo);

	//퇴근 확인
	int leave(CommuteVo vo);

	//전체 근태기록
	List<CommuteVo> selectList(CommuteVo vo, PageVo pv);

	//전체 근태 갯수 조회
	int selectcommuteTotalCount();

	//나의 근태 갯수 조회
	int selectMycommuteTotalCnt(String no);

	//부서별 조회
	List<CommuteVo> selectDeptList(String deptName);

	//직급별 조회
	List<CommuteVo> selectPosList(String posName);

	//연차조회
	List<ApprovalLeaveVo> selectLeaveList(Map<String, String> map);

}
