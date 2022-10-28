package com.kh.checkmine.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
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
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.service.BoardService;
import com.kh.checkmine.board.service.ReplyService;
import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private final BoardService service;
	private final ReplyService rs;
	
	@Autowired
	public BoardController(BoardService service, ReplyService rs) {
		this.service = service;
		this.rs = rs;	
	}
	
	//게시물 조회
	@GetMapping("list/{type}")
	public String notice(@PathVariable String type, @RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "l") String sort, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("sort", sort);
		
		int totalCount = service.selectTotalCnt(type);

		PageVo pv = null;
		if("gallery".equals(type)) {
			pv = Pagination.getPageVo(totalCount, pno, 5, 8);
		}else {
			pv = Pagination.getPageVo(totalCount, pno, 5, 14);
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
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		List<BoardVo> boardList = service.selectBoardKeyword(pv, keyword);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pv", pv);
		model.addAttribute("keyword", keyword);
		
		return "board/boardSearch";
	}
	
	//글 작성
	@GetMapping("write")
	public String write() {
		return "board/boardWrite";
	}

	//공지사항 작성
	@PostMapping("write")
	public String write(BoardVo vo, BoardAttVo attVo, HttpServletRequest req, HttpSession session) {
		String loginMemberNo = ((MemberVo)session.getAttribute("loginMember")).getNo();
		vo.setWriter(loginMemberNo);
		
		//타입 지정
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
		
		if(result == 1) {
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
	public String detail(@PathVariable String no, Model model) {
		BoardVo vo = service.selectOne(no);
		List<BoardAttVo> attList = service.selectAttList(no);
	
		model.addAttribute("board", vo);
		model.addAttribute("attList", attList);
			
		return "board/boardDetail";
	}
	
	
	//게시글 추천
	@PostMapping("recommend")
	@ResponseBody
	public String recommend(String bNo, String memberNo, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("bNo", bNo);
		map.put("memberNo", memberNo);

		int result = 0;
		//추천 기록이 있는지 확인
		int recommendList = service.selectRecommend(map);
		
		if(recommendList == 0) {
			result = service.recommend(map);	
		}else {
			result = service.recommendDelete(map);	
		}
		
		
		String recommendCnt = service.selectBoardRecommend(bNo);
		
		Gson g = new Gson();
		Map<String, String> test = new HashMap<String, String>();
		test.put("recommendList", String.valueOf(recommendList));
		test.put("recommendCnt", recommendCnt);
		
		String str = g.toJson(test);

		return str;

		
	}
	
	
	
	
	
	
	
	
	
}
