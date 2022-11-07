package com.kh.checkmine.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.board.dao.BoardDao;
import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Service
public class BoardServiceImpl implements BoardService{
	
	private final SqlSessionTemplate sst;
	private final BoardDao dao;
	
	@Autowired
	public BoardServiceImpl(SqlSessionTemplate sst, BoardDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	//게시물 리스트
	@Override
	public int selectTotalCnt(String type) {
		int total = dao.selectTotalCnt(sst, type);
		return total;
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pv, Map<String, String> map) {
		List<BoardVo> boardList = dao.selectBoardList(sst, pv, map);
		return boardList;
	}

	//검색 결과
	@Override
	public int selectKeywordCnt(String keyword) {
		int total = dao.selectTotalKeyword(sst, keyword);
		return total;
	}

	@Override
	public List<BoardVo> selectBoardKeyword(PageVo pv, String keyword) {
		List<BoardVo> boardList = dao.selectBoardKeyword(sst, pv, keyword);
		return boardList;
	}

	//글 작성 (+첨부파일)
	@Override
	@Transactional
	public int insertBoard(BoardVo vo, List<BoardAttVo> attVoList) {
		int result1 = dao.insertBoard(sst, vo);

		//첨부파일
		int	result2 = dao.insertBoardAtt(sst, attVoList);
		
		return result1 * result2;
	}

	//글 작성
	@Override
	public int insertBoard(BoardVo vo) {
		int result = dao.insertBoard(sst, vo);
		return result;
	}

	//게시글 상세보기 + 조회수 증가
	@Override
	public BoardVo selectOne(String no) {
		int result = dao.increaseHit(sst, no);
		
		if(result == 1) {
			return dao.selectOne(sst, no);			
		}
		return null;
	}

	@Override
	public List<BoardAttVo> selectAttList(String no) {
		List<BoardAttVo> attList = dao.selectAtt(sst, no);
		return attList;
	}

	//추천
	@Override
	public int recommend(Map<String, String> map) {
		int result = dao.recommend(sst, map);
		return result;
	}

	//추천수만 가져오기
	@Override
	public String selectBoardRecommend(String bNo) {
		String result = dao.selectBoardRecommend(sst, bNo);
		return result;
	}

	//추천 기록 가져오기
	@Override
	public int selectRecommend(Map<String, String> map) {
		int result = dao.selectRecommend(sst, map);
		return result;
	}

	//추천 삭제
	@Override
	public int recommendDelete(Map<String, String> map) {
		int result = dao.recommendDelete(sst, map);
		return result;
	}

	//게시글 삭제
	@Override
	public int delete(String boardNo) {
		int result = dao.delete(sst, boardNo);
		return result;
	}
	
	//게시물 수정 (+첨부파일)
	@Override
	@Transactional
	public int edit(BoardVo boardVo, List<BoardAttVo> attVoList) {
		//게시글
		int result1 = dao.edit(sst, boardVo);

		//기존 첨부파일 삭제
		int result2 = dao.deleteAtt(sst, boardVo);
		
		//첨부파일
		int result3 = dao.edit(sst, attVoList);

		return result1 * result2 * result3;
	}

	//게시글만 수정
	@Override
	public int edit(BoardVo boardVo) {
		return dao.edit(sst, boardVo);
	}
}
