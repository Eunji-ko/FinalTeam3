package com.kh.checkmine.personnel.controller;

import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.service.PersonnelService;
import com.kh.checkmine.personnel.vo.AccountVo;
import com.kh.checkmine.personnel.vo.EmpEvalVo;

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
	public String person(@RequestParam(name="ep") int ep,
						 @RequestParam(name="ap") int ap,
						 @RequestParam(name="category", required=false) String category,
						 @RequestParam(name="rsn", required=false) String rsn,
						 @RequestParam(name="empSearchType", required=false) String empSearchType,
						 @RequestParam(name="empSearchText",required=false) String empSearchText,
						 @RequestParam(name="accSearchType", required=false) String accSearchType,
						 @RequestParam(name="accSearchText", required=false) String accSearchText,
			Model model) {
		
		HashMap<String, String> empMap = new HashMap<>();
		empMap.put("rsn", rsn);
		empMap.put("type", empSearchType);
		empMap.put("text", empSearchText);
		
		HashMap<String, String> accMap = new HashMap<>();
		accMap.put("type", accSearchType);
		accMap.put("text", accSearchText);
		
		
		int totalCount = ps.selectTotalCnt(empMap);
		int totalACount = ps.selectTotalACnt(accMap);
		
		PageVo epv = Pagination.getPageVo(totalCount, ep, 5, 15);
		PageVo apv = Pagination.getPageVo(totalACount, ap, 5, 15);
		
		//디비 다녀오기
		List<MemberVo> memList = ps.selectMemberList(epv, empMap);
		List<AccountVo> accList = ps.selectAccountList(apv, accMap);
		
		//model에 데이터 담기
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		model.addAttribute("epv", epv);
		model.addAttribute("apv", apv);
		
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
			
			//화면 선택
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "거래처를 추가하는 데 실패하였습니다 !");
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}
	}
	
	//사원정보 수정
	@PostMapping("editEmp")
	public String editEmp(MemberVo vo, HttpSession session) {
		
		int result = ps.editEmp(vo);
		
		if(result == 1) {
			//정보수정 성공
			return "redirect:/personnel/main?ep=1&ap=1&category=emp";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "사원 정보를 수정하는 데 실패하였습니다 !");
			return "redirect:/personnel/main?ep=1&ap=1&category=emp";
		}
		
	}
	
	//거래처정보 수정
	@PostMapping("editAcc")
	public String editAcc(AccountVo vo, HttpSession session) {
		
		int result = ps.editAcc(vo);
		
		if(result == 1) {
			//정보수정 성공
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", "거래처 정보를 수정하는 데 실패하였습니다 !");
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}
	}
	
	@GetMapping("delAcc")
	public String deleteAcc(@RequestParam List<String> no , HttpSession session, Model model) {
		
		int result = ps.delAcc(no);
		
		if(result >= 1) {
			//삭제 성공
			
			session.setAttribute("alertMsg", result + "개의 거래처를 모두 삭제하였습니다 !");
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}else {
			//삭제 실패
			session.setAttribute("alertMsg", "거래처를 삭제하는 데 실패하였습니다 !");
			return "redirect:/personnel/main?ep=1&ap=1&category=acc";
		}
		
	}
	
	@PostMapping("checkEval")
	@ResponseBody
	public EmpEvalVo checkEval(EmpEvalVo vo) {
		
		EmpEvalVo findEval = ps.findEmpEval(vo);
		
		return findEval;
		
	}
	
	@PostMapping("evalEmp")
	@ResponseBody
	public int evalEmp(EmpEvalVo vo) {

		EmpEvalVo findEval = ps.findEmpEval(vo);
		int result;
		
		if(findEval != null) {
			vo.setNo(findEval.getNo());
			result = ps.updateEval(vo);
		}else {
			result = ps.insertEval(vo);
		}
		
		return result;
	}
	
	@GetMapping("evalList/{no}")
	public String evalList(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes, @PathVariable String no) {
		
		List<EmpEvalVo> evalList = ps.findEvalList(no);
		MemberVo emp = ps.selectEmpByNo(no);
		
		if(evalList == null) {
			
			session.setAttribute("alertMsg", "사원평가 조회를 실패하였습니다!");
			
			return "redirect:/personnel/main?ep=1&ap=1";	
			
		} else if(evalList.isEmpty()) {
			
			session.setAttribute("swalEmpty", "해당 사원에 대하여 작성된 사원평가가 없습니다 !");
			String referer = request.getHeader("Referer");
			
			return "redirect:"+ referer;
			
		} else {
			
			model.addAttribute("evalList", evalList);
			if(emp != null) {
				model.addAttribute("empName", emp.getName()); 
			}
			
			return "personnel/evalList";	
			
		}
	}
	
	
}
