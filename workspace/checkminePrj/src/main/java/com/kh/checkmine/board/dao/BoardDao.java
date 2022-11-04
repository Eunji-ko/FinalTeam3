package com.kh.checkmine.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface BoardDao {

	//게시물 리스트 - 공지사항
	int selectTotalCnt(SqlSessionTemplate sst, String type);

	List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	//검색
	int selectTotalKeyword(SqlSessionTemplate sst, String keyword);

	List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, String keyword);

	//글 작성
	int insertBoard(SqlSessionTemplate sst, BoardVo vo);

	int insertBoardAtt(SqlSessionTemplate sst, List<BoardAttVo> attVoList);

	//게시글 상세보기
	int increaseHit(SqlSessionTemplate sst, String no);

	BoardVo selectOne(SqlSessionTemplate sst, String no);

	List<BoardAttVo> selectAtt(SqlSessionTemplate sst, String no);

	//추천
	int recommend(SqlSessionTemplate sst, Map<String, String> map);

	//추천 수 가져오기
	String selectBoardRecommend(SqlSessionTemplate sst, String bNo);

	//추천 기록 확인
	int selectRecommend(SqlSessionTemplate sst, Map<String, String> map);

	//추천 삭제
	int recommendDelete(SqlSessionTemplate sst, Map<String, String> map);

	//게시글 삭제
	int delete(SqlSessionTemplate sst, String boardNo);

	//게시글 수정
	int edit(SqlSessionTemplate sst, List<BoardAttVo> attVoList);

	int edit(SqlSessionTemplate sst, BoardVo vo);
	
	int deleteAtt(SqlSessionTemplate sst, BoardVo vo);


}
