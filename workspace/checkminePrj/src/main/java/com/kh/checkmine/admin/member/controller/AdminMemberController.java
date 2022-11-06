package com.kh.checkmine.admin.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.admin.member.service.AdminMemberService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.DeptVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.member.vo.PosVo;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {
	
	private final AdminMemberService service;
	
	public AdminMemberController(AdminMemberService service) {
		this.service = service;
		
	}
	
	//사원 관리 페이지
	@GetMapping("list")
	public String member(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "a") String sort, Model model) {
		
		int totalCount = service.selectTotalCnt(sort);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		//사원 목록 불러오기
		List<MemberVo> memberList = service.selectMemberList(pv, sort);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);
		
		return "admin/member/list";
	}
	
	//사원 검색
	@GetMapping("search")
	public String search(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam String option, @RequestParam String keyword, Model model) {
		Map<String, String> map = new HashMap<>(2);
		map.put("option", option);
		map.put("keyword", keyword);
		int totalCount = service.selectKeywordCnt(map);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<MemberVo> memberList = service.selectMemberKeyword(pv, map);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pv", pv);
		model.addAttribute("option", option);
		model.addAttribute("keyword", keyword);
		
		return "admin/member/search";
	}
	
	
	
		
	//사원 관리 > 사원 등록 
	@GetMapping("add")
	public String memberAdd(Model model) {
		//부서 목록
		List<DeptVo> dept = service.selectDeptList();
		
		//직위 목록
		List<PosVo> pos = service.selectPosList();
		
		model.addAttribute("dept", dept);
		model.addAttribute("pos", pos);
		
		return "admin/member/add";
	}
	
	@PostMapping("add")
	public String memberAdd(MemberVo vo, HttpServletRequest req, HttpSession session) {
		if(vo.getProfile() != null && !vo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setPhotoName(changeName);
			vo.setPhotoPath(savePath);
		}
		
		//권한 ',' 제거
		if(vo.getPermission() != null) {
			String permission = vo.getPermission().replace(",", "");			
			vo.setPermission(permission);
		}
		int result = service.insertMember(vo);
		
		if(result == 1) {
			session.setAttribute("msg", "정상적으로 등록되었습니다.");
			return "redirect:/admin/member/list";
			
		}else {
			
			if(!vo.getProfile().isEmpty()) {
				String savepath = vo.getPhotoPath()+ vo.getPhotoName();
				new File(savepath).delete();
				}
			}
			session.setAttribute("msg", "죄송합니다. 문제가 발생하였습니다.");
			return "redirect:/admin/member/list";

	}
	
	//아이디 중복
	@PostMapping("dup")
	@ResponseBody
	public String dup(String id) {
		String result = service.checkDup(id);

		return result;

	}
	
	//사원 정보
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model) {
		//부서 목록
		List<DeptVo> dept = service.selectDeptList();
		
		//직위 목록
		List<PosVo> pos = service.selectPosList();
		
		MemberVo memberVo = service.selectMember(no);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("dept", dept);
		model.addAttribute("pos", pos);
		return "admin/member/detail";
	}
	
	
	//사원 수정
	@PostMapping("edit/{no}")
	public String edit(@PathVariable String no, MemberVo vo, HttpServletRequest req, HttpSession session) {
	
		//새로운 파일 있다면 업로드, 원래 있던 파일 삭제
		if(vo.getProfile() != null && !vo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			if(vo.getPhotoName() != null) {
				File file = new File(savePath + vo.getPhotoName());
				if(file.exists()) {
					file.delete();
				}				
			}else {
				//기존 사진없으면 path 설정
				vo.setPhotoPath(savePath);
			}
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setPhotoName(changeName);
		}
		
		//권한 ',' 제거
		if(vo.getPermission() != null) {
			String permission = vo.getPermission().replace(",", "");
			vo.setPermission(permission);			
		}
		int result = service.edit(vo);
		if(result == 1) {
			session.setAttribute("msg", "정상적으로 수정되었습니다.");
			return "redirect:/admin/member/list";
			
		}else {
			
			if(!vo.getProfile().isEmpty()) {
				String savepath = vo.getPhotoPath()+ vo.getPhotoName();
				new File(savepath).delete();
				}
			}
			session.setAttribute("msg", "죄송합니다. 문제가 발생하였습니다.");
			return "redirect:/admin/member/list";

	}
	
	
	
	
	

}
