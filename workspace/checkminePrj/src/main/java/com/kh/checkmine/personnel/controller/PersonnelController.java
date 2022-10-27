package com.kh.checkmine.personnel.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.service.PersonnelService;
import com.kh.checkmine.personnel.vo.AccountVo;

@Controller
@RequestMapping("personnel")
public class PersonnelController {
	
	private final PersonnelService ps;
	
	@Autowired
	public PersonnelController(PersonnelService ps) {
		this.ps = ps;
	}
	
	//인사관리 페이지 조회
	@GetMapping("main")
	public String person(Model model) {
		
		//디비 다녀오기
		List<MemberVo> memList = ps.selectMemberList();
		List<AccountVo> accList = ps.selectAccountList();
		
		//model에 데이터 담기
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		
		//화면 선택
		return "personnel/main";
	}
	
	//사원정보 모달
	@GetMapping("empModal")
	@ResponseBody
	public MemberVo empModal(String no) {
		MemberVo emp = ps.selectEmpByNo(no);
		return emp;			
	}
	
	//거래처정보 모달
	@GetMapping("accModal")
	@ResponseBody
	public AccountVo accModal(String no) {
		AccountVo acc = ps.selectAccByNo(no);
		return acc;
	}
	
	//거래처 추가
	@PostMapping("insertAcc")
	public String insertAcc(AccountVo vo, HttpSession session, Model model) {
		
		int result = ps.insertAcc(vo);
		
		if(result == 1) {
			//정보수정 성공
			
			//디비 다녀오기
			List<MemberVo> memList = ps.selectMemberList();
			List<AccountVo> accList = ps.selectAccountList();

			//model에 데이터 담기
			model.addAttribute("memList", memList);
			model.addAttribute("accList", accList);
			
			//화면 선택
			return "personnel/main";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "거래처를 추가하는 데 실패하였습니다 !");
			return "redirect:/personnel/main";
		}
	}
	
	//사원정보 수정
	@PostMapping("editEmp")
	public String editEmp(MemberVo vo, HttpSession session) {
		
		int result = ps.editEmp(vo);
		
		if(result == 1) {
			//정보수정 성공
			return "redirect:/personnel/main";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "사원 정보를 수정하는 데 실패하였습니다 !");
			return "redirect:/personnel/main";
		}
		
	}
	
	//거래처정보 수정
	@PostMapping("editAcc")
	public String editAcc(AccountVo vo, HttpSession session) {
		
		int result = ps.editAcc(vo);
		
		if(result == 1) {
			//정보수정 성공
			return "redirect:/personnel/main";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "거래처 정보를 수정하는 데 실패하였습니다 !");
			return "redirect:/personnel/main";
		}
	}
	
	@GetMapping("deleteAcc/{no}")
	public String deleteAcc(HttpSession session, Model model, @PathVariable String no) {
		
		int result = ps.delAcc(no);
		
		if(result == 1) {
			//삭제 성공
			
			//디비 다녀오기
			List<MemberVo> memList = ps.selectMemberList();
			List<AccountVo> accList = ps.selectAccountList();

			//model에 데이터 담기
			model.addAttribute("memList", memList);
			model.addAttribute("accList", accList);
			
			return "personnel/main";
		}else {
			//삭제 실패
			session.setAttribute("alertMsg", "거래처를 삭제하는 데 실패하였습니다 !");
			return "redirect:/personnel/main";
		}
		
	}
	
	//사원 재직상태에 따른 조회
	@GetMapping("selectRsn/{rsn}")
	public String editAcc(Model model, @PathVariable String rsn) {
		List<MemberVo> memList = ps.selectMemberListByRsn(rsn);
		List<AccountVo> accList = ps.selectAccountList();
		
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		
		return "personnel/main";
	}
	
	//사원 검색
	@PostMapping("searchEmp")
	public String searchEmp(Model model, String searchType, String searchText) {
		HashMap<String, String> searchMap = new HashMap<>();
		searchMap.put("type", searchType);
		searchMap.put("text", searchText);
		List<MemberVo> memList = ps.selectMemberListBySearch(searchMap);
		List<AccountVo> accList = ps.selectAccountList();
		
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		
		return "personnel/main";
	}
	
	//거래처 검색
	@PostMapping("searchAcc")
	public String searchAcc(Model model, String searchType, String searchText) {
		HashMap<String, String> searchMap = new HashMap<>();
		searchMap.put("type", searchType);
		searchMap.put("text", searchText);
		List<MemberVo> memList = ps.selectMemberList();
		List<AccountVo> accList = ps.selectAccountListBySearch(searchMap);
		
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		
		return "personnel/main";
	}
	
	
}
