package com.kh.checkmine.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.checkmine.admin.service.AdminBoardService;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.service.ReplyService;
import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {
	
	private final AdminBoardService service;
	private final ReplyService rs;
	
	@Autowired
	public AdminBoardController(AdminBoardService service, ReplyService rs) {
		this.service = service;
		this.rs = rs;	
	}
	
	//게시물 조회
	@GetMapping("list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "a") String sort, Model model) {
		
		int totalCount = service.selectTotalCnt(sort);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		List<BoardVo> boardList = service.selectBoardList(pv, sort);
		model.addAttribute("boardList", boardList);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);
		return "admin/adminBoard";
		
	}
	
	//게시물 선택삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(@RequestParam(value="checkArr[]") ArrayList<Integer> checkArr, HttpSession session) {
	
		 
		 for(int i = 0; i < checkArr.size(); i++) { 
			 int result = service.delete(checkArr.get(i));
		 if(result == -1) { 
			 session.setAttribute("msg", "게시글 삭제 실패"); 
			 return "fail"; 
			 }
		 }
		 
		return "ok";
		
	}
	
	//게시물 검색
	@GetMapping("search")
	public String search(@RequestParam(name = "p") int pno, @RequestParam String option, @RequestParam String keyword, Model model) {
		Map<String, String> map = new HashMap<>(2);
		map.put("option", option);
		map.put("keyword", keyword);
		int totalCount = service.selectKeywordCnt(map);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		List<BoardVo> boardList = service.selectBoardKeyword(pv, map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pv", pv);
		model.addAttribute("option", option);
		model.addAttribute("keyword", keyword);
		
		return "admin/adminBoardSearch";
	}
	
	//공지사항 작성 페이지
	@GetMapping("write")
	public String write() {
		return "admin/adminNoticeWrite";
	}
	
	//공지사항 작성
	@PostMapping("write")
	public String write(BoardVo vo, BoardAttVo attVo, HttpServletRequest req, HttpSession session) {
		String loginAdminNo = ((AdminVo)session.getAttribute("loginAdmin")).getNo();
		
		vo.setWriter(loginAdminNo);
		vo.setType("N"); //공지사항
		
		int result = 0;
		
		//파일 업로드 후 attVo에 담기
		MultipartFile[] fArr =  attVo.getAttach();
		List<BoardAttVo> attVoList = new LinkedList<BoardAttVo>();
		
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
			
			result = service.insertBoard(vo);
		}
		
		if(result >= 1) {
			session.setAttribute("msg", "정상적으로 등록되었습니다.");
			return "redirect:/admin/board/list";
			
		}else {
			
			if(!attVoList.isEmpty()) {
				for(int i = 0; i < attVoList.size(); i++) {
					String savepath = attVoList.get(i).getFilePath()+ attVoList.get(i).getName();
					new File(savepath).delete();
				}
			}
			session.setAttribute("msg", "죄송합니다. 문제가 발생하였습니다.");
			return "redirect:/admin/board/list";
			
		}
	}
	
	//상세보기
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model) {
		BoardVo vo = service.selectOne(no);
		List<BoardAttVo> attList = service.selectAttList(no);
		List<ReplyVo> replyList = rs.selectReplyList(no);
		
		model.addAttribute("board", vo);
		model.addAttribute("attList", attList);
		model.addAttribute("replyList", replyList);
		
		
		return "admin/adminBoardDetail";
	}
	
	
	//댓글
	
	

}
