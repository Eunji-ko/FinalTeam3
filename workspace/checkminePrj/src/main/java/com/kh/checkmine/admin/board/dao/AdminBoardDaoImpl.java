package com.kh.checkmine.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	//게시글 조회
	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardList", sort, rb); 
	}

	//게시글 수
	@Override
	public int selectBoardTotal(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("boardMapper.selectBoardTotal", sort);
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String boardNo) {
		return sst.update("boardMapper.deleteBoard", boardNo);
	}

	//게시물 검색
	@Override
	public List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardKeyword", map, rb);
	}

	//게시글 수 + 검색
	@Override
	public int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("boardMapper.selectTotalKeyword", map);
	}

	//공지사항 올리기
	@Override
	public int insertBoard(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("boardMapper.insertBoard", vo);
	}

	@Override
	public int insertBoardAtt(SqlSessionTemplate sst, List<BoardAttVo> attVoList) {
		return sst.insert("boardMapper.insertBoardAtt", attVoList);
	}

	//상세보기
	@Override
	public BoardVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("boardMapper.selectOne", no);
	}

	@Override
	public List<BoardAttVo> selectAtt(SqlSessionTemplate sst, String no) {
		return sst.selectList("boardMapper.selectAtt", no);
	}

	//조회수 증가
	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("boardMapper.increaseHit", no);
	}

	//글 수정
	@Override
	public int edit(SqlSessionTemplate sst, BoardVo vo) {
		return sst.update("boardMapper.edit", vo);
	}

	//파일 수정
	@Override
	public int edit(SqlSessionTemplate sst, List<BoardAttVo> attVoList) {
		return sst.insert("boardMapper.updateBoardAtt", attVoList);
	}

	//기존 파일 삭제
	@Override
	public int deleteAtt(SqlSessionTemplate sst, BoardVo vo) {
		return sst.delete("boardMapper.deleteAtt", vo);
	}

	//영구 삭제
	@Override
	public int hardDelete(SqlSessionTemplate sst, String boardNo) {
		return sst.delete("boardMapper.hardDelete", boardNo);
	}

	//게시글 복원
	@Override
	public int restoreBoard(SqlSessionTemplate sst, String boardNo) {
		return sst.update("boardMapper.restoreBoard", boardNo);
	}

	//삭제된 게시글 관리
	@Override
	public int selectDeleteTotalCnt(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("boardMapper.selectDeleteTotalCnt", sort);
	}

	@Override
	public List<BoardVo> selectDeleteList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectDeleteList", sort, rb); 
	}

}
