package com.kh.checkmine.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalFileVo;
import com.kh.checkmine.approval.vo.ApprovalVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService service;
	
	@Autowired
	public ApprovalController(ApprovalService service) {
		super();
		this.service = service;
	}

	@GetMapping(value= {""})
	public String approval() {
		return "approval/approval-outline";
	}
	
	@GetMapping(value={"list/{pno}","list"})
	public String list(@PathVariable(required = false) String pno, Model model, HttpSession session) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String employeeNo = loginMember.getNo();
		
		//페이지번호 파싱
		if(pno == null) {
			pno = "1";
		}
		int pnoInt = Integer.parseInt(pno);
		
		int totalCount = service.selectTotalCnt(employeeNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pnoInt, 5, 15);
		
		//디비 데이터 조회
		List<ApprovalDocVo> voList = service.selectList(employeeNo, pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "approval/list";
	}
	
	@GetMapping("/{dno}")
	public String detail(@PathVariable String dno, Model model, HttpSession session) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호로 결재정보 조회해오기
		ApprovalVo apVo = service.selectApByDocNo(dno);
		
		//결재자 정보 확인
		if(loginMember.getNo() != apVo.getFirstApprover()) {
			return "redirect:/approval";
		}else if(loginMember.getNo() != apVo.getSecondApprover()) {
			return "redirect:/approval";
		}else if(loginMember.getNo() != apVo.getThirdApprover()) {
			return "redirect:/approval";
		}else if(loginMember.getNo() != apVo.getFinalApprover()) {
			return "redirect:/approval";
		}
		
		//작성X 결재O
		if(apVo != null) {
			//문서번호로 결재문서 조회해오기
			ApprovalDocVo docVo = service.selectDocByNo(dno);
			MemberVo writerVo = service.selectEmpByNo(docVo.getWriterNo());
			
			switch(docVo.getType()) {
			case "D":
				ApprovalDraftVo draftVo = service.selectDraftByNo(dno);
				model.addAttribute("draftVo", draftVo);
				break;
			case "P":
				break;
			case "M":
				break;
			case "E":
				break;
			case "B":
				break;
			case "S":
				break;
			case "L":
				break;
			}
			
			//작성자 이름 가져오기
			docVo.setWriterNo(writerVo.getName());
			
			model.addAttribute("docVo", docVo);
		}
		
		//결재자 이름 가져오기
		if(apVo.getFirstApprover() != null) {
			apVo.setFirstApprover(service.selectEmpByNo(apVo.getFirstApprover()).getName());			
		}
		if(apVo.getSecondApprover() != null) {
			apVo.setSecondApprover(service.selectEmpByNo(apVo.getSecondApprover()).getName());			
		}
		if(apVo.getThirdApprover() != null) {
			apVo.setThirdApprover(service.selectEmpByNo(apVo.getThirdApprover()).getName());
		}
		apVo.setFinalApprover(service.selectEmpByNo(apVo.getFinalApprover()).getName());
		
		model.addAttribute("apVo", apVo);
		return "approval/approval-outline";
	}
	
	@PostMapping(value={"/draft/{dno}"})
	public String draft(ApprovalDocVo docVo, ApprovalDraftVo draftVo, ApprovalFileVo fileVo, HttpSession session) {
		
		//회원 정보 가져오기
		
		//문서번호 존재 여부 확인
		
		return "redirect:/approval";
	}

}
