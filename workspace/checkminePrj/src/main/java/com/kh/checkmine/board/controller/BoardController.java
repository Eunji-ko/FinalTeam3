package com.kh.checkmine.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.checkmine.board.service.BoardService;
import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

/*
 * 사용자 > 게시판
*/
@Controller
@RequestMapping("board")
public class BoardController {
	
	private final BoardService service;
	
	@Autowired
	public BoardController(BoardService service) {
		this.service = service;	
	}
	
	//게시물 조회
	@GetMapping("list/{type}")
	public String list(@PathVariable String type, @RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "l") String sort, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("sort", sort);
		
		int totalCount = service.selectTotalCnt(type);

		PageVo pv = null;
		if("gallery".equals(type)) { //갤러리는 8개씩 조회
			pv = Pagination.getPageVo(totalCount, pno, 5, 8);
		}else {
			pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		}
		
		List<BoardVo> boardList = service.selectBoardList(pv, map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("type", type);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);

		return "board/"+type+"List";
	}
	
	//게시물 검색
	@GetMapping("search")
	public String search(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam String keyword, Model model) {

		int totalCount = service.selectKeywordCnt(keyword);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<BoardVo> boardList = service.selectBoardKeyword(pv, keyword);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pv", pv);
		model.addAttribute("keyword", keyword);
		
		return "board/search";
	}
	
	//게시물 작성 페이지
	@GetMapping("write")
	public String write() {
		return "board/write";
	}

	//게시물 작성
	@PostMapping("write")
	public String write(BoardVo vo, BoardAttVo attVo, HttpServletRequest req, HttpSession session) {
		String loginMemberNo = ((MemberVo)session.getAttribute("loginMember")).getNo();
		vo.setWriter(loginMemberNo);
		
		//타입 지정 (완료 후 관련 목록으로 보내기 위함)
		String type = "";
		
		if("N".equals(vo.getType())) {
			type = "notice";
		}else if("C".equals(vo.getType())){
			type = "community";
		}else {
			type = "gallery";
		}

		int result = 0;
		
		//파일 업로드 후 attVo에 담기
		MultipartFile[] fArr = attVo.getAttach();
		List<BoardAttVo> attVoList = new ArrayList<BoardAttVo>();
		
		if(!fArr[0].isEmpty()) { //전달받은 파일있음
			String savePath = req.getServletContext().getRealPath("/resources/upload/board/");
			
			for(int i = 0; i < fArr.length; i++) {
				BoardAttVo att = new BoardAttVo();
				MultipartFile f = fArr[i];
				
				String changeName = FileUploader.fileUpload(f, savePath);
				att.setName(changeName);
				att.setFilePath(savePath);
				attVoList.add(att);
			}
			result = service.insertBoard(vo, attVoList);
		}else {
			//첨부파일 없이 글만 작성
			result = service.insertBoard(vo);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "정상적으로 등록되었습니다.");
			return "redirect:/board/list/"+type;
		}else {
			//문제 발생하면 이전에 올렸던 파일 제거
			if(!attVoList.isEmpty()) {
				for(int i = 0; i < attVoList.size(); i++) {
					String savepath = attVoList.get(i).getFilePath()+ attVoList.get(i).getName();
					new File(savepath).delete();
				}
			}
			session.setAttribute("alertMsg", "죄송합니다. 문제가 발생하였습니다.");
			return "redirect:/board/list/"+type;
		}
	}
	
	//상세보기
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model, HttpSession session) {
		MemberVo member = (MemberVo)session.getAttribute("loginMember");
		
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("bNo", no);
		map.put("memberNo", member.getNo());
		
		
		BoardVo boardVo = service.selectOne(no);
		List<BoardAttVo> attList = service.selectAttList(no);
		int recommendList = service.selectRecommend(map);
	
		model.addAttribute("board", boardVo);
		model.addAttribute("attList", attList);
		model.addAttribute("recommendList", recommendList);
			
		return "board/detail";
	}
	
	
	//게시글 추천
	@PostMapping(value="recommend", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String recommend(String bNo, String memberNo, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("bNo", bNo);
		map.put("memberNo", memberNo);

		//추천 기록이 있는지 확인
		int recommendList = service.selectRecommend(map);
		
		//있으면 지우고 없으면 insert
		if(recommendList == 0) {
			service.recommend(map);	
		}else {
			service.recommendDelete(map);	
		}
		
		String recommendCnt = service.selectBoardRecommend(bNo);
		
		Gson g = new Gson();
		Map<String, String> recommend = new HashMap<String, String>(2);
		recommend.put("recommendCnt", recommendCnt);
		recommend.put("recommendList", String.valueOf(recommendList));

		String str = g.toJson(recommend);

		return str;
	}
	
	
	//게시물 삭제
	@GetMapping("delete/{type}/{no}")
	public String delete(@PathVariable String no, @PathVariable String type, HttpSession session, Model model) {
		int result = service.delete(no);
		
		//타입 지정 (완료 후 관련 목록으로 보내기 위함)
		if("N".equals(type)) {
			type = "notice";
		}else if("C".equals(type)){
			type = "community";
		}else {
			type = "gallery";
		}
		
		if(result == 1) {
			session.setAttribute("alertMsg", "게시물을 삭제하였습니다.");
			return "redirect:/board/list/"+type;
		}else {
			session.setAttribute("alertMsg", "삭제 처리 중 문제가 발생하였습니다.");
			return "redirect:/board/list/"+type;
		}
	}
	
	//게시물 수정
	@GetMapping("edit/{no}")
	public String edit(@PathVariable String no, Model model) {
		BoardVo boardVo = service.selectOne(no);
		model.addAttribute("board", boardVo);
		
		return "board/edit";
		
	}
	
	//게시물 수정
	@PostMapping("edit/{no}")
	public String edit(@PathVariable String no, BoardVo boardVo, BoardAttVo attVo, HttpSession session, HttpServletRequest req) {
		//새로 첨부된 파일 처리
		int result = 0;
		
		MultipartFile[] fArr =  attVo.getAttach();
		List<BoardAttVo> attVoList = new ArrayList<BoardAttVo>();
		
		if(!fArr[0].isEmpty()) { //전달받은 파일있음
			List<BoardAttVo> attList = service.selectAttList(no);
			String savePath = req.getServletContext().getRealPath("/resources/upload/board/");
			
			//기존 파일 삭제 후 업로드 (저장소 내 파일)
			if(!attList.isEmpty()) {
				for(int i = 0; i < attList.size(); i++) {
					File file = new File(savePath + attList.get(i).getName());
					if(file.exists()) {
						file.delete();
					}
				}			
			}
			
			for(int i = 0; i < fArr.length; i++) {
				BoardAttVo att = new BoardAttVo();
				MultipartFile f = fArr[i];
				
				String changeName = FileUploader.fileUpload(f, savePath);
				att.setName(changeName);
				att.setFilePath(savePath);
				att.setBNo(no);
				attVoList.add(att);
			}
			result = service.edit(boardVo, attVoList);
		}else {
			//제목 또는 내용만 수정 시
			result = service.edit(boardVo);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시물을 수정하였습니다.");
			return "redirect:/board/detail/" + no;
		}else {
			session.setAttribute("alertMsg", "처리 중 문제가 발생하였습니다.");
			return "redirect:/board/list/notice";
		}
	
	}
	
	
	//썸머노트 본문 파일 처리
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req)  {
		JsonObject jsonObject = new JsonObject();
	
		// 내부경로로 저장
		String savePath = req.getServletContext().getRealPath("/resources/upload/board/");
		String changeName = FileUploader.fileUpload(multipartFile, savePath);

			jsonObject.addProperty("fileName", changeName);
			jsonObject.addProperty("responseCode", "success");
		
		String a = jsonObject.toString();
		return a;
	}
}
